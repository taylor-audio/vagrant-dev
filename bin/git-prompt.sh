PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w \[\033[0;32m\]$(git branch 2>/dev/null | grep "^*" | colrm 1 2)\n\[\033[00m\]\$ '