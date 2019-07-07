export $(gnome-keyring-daemon --daemonize --start)
if [ -z "$SSH_AUTH_SOCK" ] ; then
	eval `ssh-agent -s`
	ssh-add
fi
export PS1="\u@\h:\[\e[32m\]\w\[\e[m\] "
source ~/.git-completion.sh
export TERM=xterm-256color
alias gti=git

