#!/bin/bash

dotfiles="./dotfiles"

oargs="$@"

port=""
ident=""
runs=true
params=""

while [[ $* ]]
do
    OPTIND=1
    if [[ $1 =~ ^- ]]; then
        getopts ":hi:p:" opt
        case "$opt" in
            h)
                runs=false
                ;;
            i)
                ident="-i $OPTARG"
                shift
                ;;
            p)
                port="-p $OPTARG"
                shift
                ;;
        esac
    else
        params="$1"
    fi
    shift
done

dirname="$(mktemp -u)"

echo "Loading dotfiles..."
rsync -r -e "ssh $port $ident" $dotfiles/ "$params:$dirname"
env LC_DIR="$dirname" ssh -o SendEnv=LC_DIR -t $oargs ':; \
    chmod 700 $LC_DIR; \
    bash --rcfile $LC_DIR/remotebash.sh -i'


