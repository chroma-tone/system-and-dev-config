export $(gnome-keyring-daemon --daemonize --start)
if [ -z "$SSH_AUTH_SOCK" ] ; then
	eval `ssh-agent -s`
	ssh-add
fi
PS1="\[\033[35m\]\$(/bin/date): \h \n\[\033[32m\]\w\n\[\033[1;32m\]\u : $ \\033[0m"
source ~/.git-completion.sh
export TERM=xterm-256color
alias gti=git

