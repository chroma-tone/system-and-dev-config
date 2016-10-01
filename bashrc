if [ -z "$SSH_AUTH_SOCK" ] ; then
	eval `ssh-agent -s`
	ssh-add
fi
source ~/.git-completion.sh
export TERM=xterm-256color
alias gti=git
