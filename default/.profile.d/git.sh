# git
_git() {
	cd ~/.dotapps/home/dotfiles@kaduhiro
	git $@
	cd - > /dev/null
}

alias .git=_git
alias .gitconfig='vi ~/.gitconfig'
