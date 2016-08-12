echo "Dotfile load success!"

if [ -f $LC_DIR/.bashrc ]; then
    source $LC_DIR/.bashrc
fi

if [ -f $LC_DIR/.vimrc ]; then
    alias vim="vim -u $LC_DIR/.vimrc"
fi
if [ -f $LC_DIR/.gdbinit ]; then
    alias gdb="gdb -q --nx -x $LC_DIR/.gdbinit"
fi

