export COVERSHOT_HOME=$NODE_HOME/lib/node_modules/covershot
export PATH=$COVERSHOT_HOME/bin:~/bin:$NODE_HOME/bin:/usr/local/sbin:/usr/local/bin:$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

RS='\[\e[0m\]'
GR='\[\e[0;32m\]'
RD='\[\e[0;31m\]'
YL='\[\e[0;33m\]'

export PROMPT_DIRTRIM=2

# Super-awesome custom bash prompt (colored)
export PS1="$GR\u$RS@$GR\h$RS:$RD\w$RS [$YL\!$RS] $GR>>$RS "

# custom bash prompt (no colors)
#PS1="\u@\h:\w [\!] >> "

. ~/.berksenv
