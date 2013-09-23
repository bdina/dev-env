NODE_HOME=/usr/local/share/npm
AUTOREPL_HOME=~/git/autorepl

export PATH=~/bin:$AUTOREPL_HOME/bin:$NODE_HOME/bin:$PATH
export NODE_PATH=$NODE_HOME/lib/node_modules/

# setup for chef/vagrant
export SVN_USERNAME=bdina
export PROVISIONER="chef_solo"

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
alias nkill="pgrep -l node|cut -d ' ' -f 1|xargs kill"

# uncomment to turn modify the node.js prompt (and make it purple in color)
# alias node="env NODE_NO_READLINE=1 rlwrap -ppurple node"

# setup the OCaml OPAM environment
eval `opam config -env`

source ~/.bashrc
