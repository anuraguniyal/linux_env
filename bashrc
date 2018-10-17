# bashrc will be sourced, so hardcoding path of file
src="$HOME/linux_env/.bashrc"
DIR=$(dirname $src)
for f in $DIR/bash.d/*.sh; do
    source $f
done

# import local bashrc
if [ -e $HOME/.local_bashrc ]; then
    source $HOME/.local_bashrc
fi
