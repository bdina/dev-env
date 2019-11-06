# general alias
alias ls='ls -G'
alias ds='dirs -v'
alias grep='grep --color=auto'

# alias for git
alias gc='git commit -m'
alias gs='git status'
alias ga='git add'
alias gd='git diff'
alias gr='git reset --mixed HEAD^'

# useful aliases that go withouth a specific category
alias certdump='openssl x509 -noout -text -in'

alias denv='eval `docker-machine env default`'
alias dkill='sudo pkill -9 xhyve; sleep 2; docker-machine start'

source ~/.bashrc
export PATH="/usr/local/opt/scala@2.12/bin:$PATH"
