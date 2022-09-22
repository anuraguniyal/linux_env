
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# needed on mac
export CLICOLOR=1
export t_bold=$(tput bold)
export t_normal=$(tput sgr0)
export t_red=$(tput setaf 1)
export t_green=$(tput setaf 2)
export t_yellow=$(tput setaf 3)
export t_blue=$(tput setaf 4)
export t_magenta=$(tput setaf 5)
export t_cyan=$(tput setaf 6)
export t_white=$(tput setaf 7)

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# add git branch to path
parse_git_branch() {
 echo `git rev-parse --abbrev-ref HEAD 2> /dev/null`
}

export PS1='$(date +%b-%d\ %H:%M:%S) \u@$(hostname -s) ${t_yellow} \w ${t_red} $(parse_git_branch) ${t_normal}\n$ '

export HISTTIMEFORMAT='%F %T %t'
export P4CONFIG='.p4config'
export P4EDITOR='vim'
# setup global npm folder
export NPM_CONFIG_PREFIX=~/.npm-global
export ANDROID_SDK=$HOME/Android/Sdk/
export ANDROID_HOME=$HOME/Android/Sdk/
export PATH=$PATH:$HOME/bin:$HOME/linux_env/bin
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    export PATH=$PATH:$HOME/.rvm/bin:~/.npm-global/bin

elif [[ "$OSTYPE" == "darwin"* ]]; then
    alias mvi='open -a MacVim.app'
fi

save_custom_history(){
    CUSTOM_HISTORY_FILE=~/.custom_history
    echo "0.command=$(history|tail -1)" >> $CUSTOM_HISTORY_FILE
    echo "1.hostname=$(hostname)" >> $CUSTOM_HISTORY_FILE
    echo "2.whoami=$(who am i)" >> $CUSTOM_HISTORY_FILE
    echo "3.logname=$LOGNAME" >> $CUSTOM_HISTORY_FILE
    echo "4.pwd=$(pwd)" >> $CUSTOM_HISTORY_FILE
}

PROMPT_COMMAND=save_custom_history

# attach to main tmux or create main session
if [ -x "$(command -v tmux)" ]; then
    tmux attach -t main || tmux new -s main
fi
