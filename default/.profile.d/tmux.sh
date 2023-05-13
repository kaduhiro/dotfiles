# tmux
alias .tmux.conf='vi ~/.tmux.conf'
alias .tmux-source='tmux source-file ~/.tmux.conf'

# enable ssh-agent in tmux
function _tmux_ssh_agent() {
	SSH_AGENT="$HOME/.ssh/agent"
	
	SOCKET=$SSH_AUTH_SOCK
	if [ -S "$SOCKET" ]; then
		SOCKET=$(readlink -f "$SOCKET" > /dev/null 2>&1 || .readlink "$SOCKET")
	fi
	
	case "$SOCKET" in
	*/tmp/*/agent.[0-9]*)
		ln -sfn "$SOCKET" "$SSH_AGENT"
		.success "activate ssh-agent '$SSH_AUTH_SOCK' -> '$SSH_AGENT'"
		;;
	esac
	
	if [ -S "$SSH_AGENT" ]; then
		export SSH_AUTH_SOCK=$SSH_AGENT
	else
		.warning "not use ssh-agent '$SSH_AGENT'"
	fi
}

_tmux_ssh_agent

# run when shell starts
if [ -z $VSCODE_TASKS ] && [ -z $TMUX ] && type tmux > /dev/null; then
	tmux a > /dev/null 2>&1 || .warning 'no session on tmux'
fi
