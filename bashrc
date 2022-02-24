# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

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

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/dbc/software/rvm/bin"
# export kubeconfig as env so that kubeconfig in local folder is used :)
export KUBECONFIG=kubeconfig
