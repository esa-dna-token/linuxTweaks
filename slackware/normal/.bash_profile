
## so i know where i am in repos
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

#####################################################
####  I LOVE THESE PASTEBIN COMMAND LINE TOOLS!  ####
#####################################################

## for images
## https://clbin.com/EChRsk.png
## usage: clbin IMAGENAME(s)
clbin() {
  curl -F "clbin=@$@" https://clbin.com
}

## for text/code
## http://ix.io/iiQ
## usage: ix FILENAME(s)
ix() {
  cat "$@" | curl -F 'f:1=<-' ix.io
}

## for text/code
## http://sprunge.us/cJOa
## usage: spru FILENAME(s)
spru() {
  cat "$@" | curl -F 'sprunge=<-' http://sprunge.us
}

###############
##  aliases  ##
###############

alias reboot='sudo /sbin/reboot'
alias shutdown='sudo /sbin/shutdown -h now'

## make .bash_history work in tmux /
## across multiple terminals
shopt -s histappend
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
export PS1='\u@\w:$(parse_git_branch)\$ '

## i add this in /etc/profile,
## only here for reference
###if [ -z "$SSH_AUTH_SOCK" ]; then
###  eval `ssh-agent`
###  ssh-add
###fi

