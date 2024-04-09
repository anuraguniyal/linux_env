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
export PATH="$PATH:$HOME/dbc/software/rvm/bin"
# export kubeconfig as env so that kubeconfig in local folder is used :)
export KUBECONFIG=kubeconfig

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/dbc/sc-dbc2130/auniyal/software/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/dbc/sc-dbc2130/auniyal/software/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/dbc/sc-dbc2130/auniyal/software/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/dbc/sc-dbc2130/auniyal/software/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
