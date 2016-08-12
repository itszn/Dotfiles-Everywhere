# Dotfiles-Everywhere
A bash script to sync portable dotfiles to any server you ssh into.

The `dotfiles` directory will by uploaded with rsync to a temp folder on the remote server.
You then will ssh in and execute a setup script to alias programs to use these files.

Add any portable dotfiles into `dotfiles/.`, and modify `dotfiles/remotebash.sh` to create any aliases you need for them.

Usage:
`./sshde.sh <normal ssh arguments>`
