# git
dotgit() {
	cd ~/.dotapps/home/dotfiles@kaduhiro
	git $@
	cd - > /dev/null
}

alias .git=dotgit
alias .gitconfig='vi ~/.gitconfig'
alias .gitignore='vi ~/.config/git/ignore'
