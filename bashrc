# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# bashrc will be sourced, so hardcoding path of file
src="$HOME/linux_env/bashrc"
DIR=$(dirname $src)

# Alias definitions.
# first source linux_env aliases
. $DIR/bash_aliases
# then source local aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

for f in $DIR/bash.d/*.sh; do
    source $f
done

# import local bashrc
if [ -e $HOME/.local_bashrc ]; then
    source $HOME/.local_bashrc
fi

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/software/rvm/bin"
# export kubeconfig as env so that kubeconfig in local folder is used :)
export KUBECONFIG=kubeconfig

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
