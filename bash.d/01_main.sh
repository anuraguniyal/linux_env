
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

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
 git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
 }

export PS1="\n\[\033[00m\]\$(date +%b-%d\ %H:%M:%S) \u@$(hostname -s)\[\033[01;33m\] \w \[\033[31m\]\$(parse_git_branch)\n\[\033[00m\]$\[\033[00m\] "

export HISTTIMEFORMAT='%F %T %t'
export P4CONFIG='.p4config'
export P4EDITOR='vim'

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    export PATH=$PATH:$HOME/bin:$HOME/linux_env/bin:$HOME/.rvm/bin

elif [[ "$OSTYPE" == "darwin"* ]]; then
    alias mvi='open -a MacVim.app'
fi

export PATH="$HOME/bin:$HOME/.vim/bin:$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

save_custom_history(){
    CUSTOM_HISTORY_FILE=~/.custom_history
    echo "0.command=$(history|tail -1)" >> $CUSTOM_HISTORY_FILE
    echo "1.hostname=$(hostname)" >> $CUSTOM_HISTORY_FILE
    echo "2.whoami=$(who am i)" >> $CUSTOM_HISTORY_FILE
    echo "3.logname=$LOGNAME" >> $CUSTOM_HISTORY_FILE
}

PROMPT_COMMAND=save_custom_history

# attach to main tmux
if [ -x "$(command -v tmux)" ]; then
    tmux attach -t main
fi
