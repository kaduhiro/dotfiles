[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# #################### general ####################
export LANG=en_US.UTF-8
PROMPT="%{${fg[green]}%}[%n@%m %~]$%{${reset_color}%} "

autoload -Uz colors; colors

export PATH="$PATH:$HOME/.bin:$HOME/.local/bin"

export EDITOR=vim
bindkey -e

# history
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=1000000
setopt inc_append_history
setopt share_history

autoload -Uz select-word-style; select-word-style default
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified

# version control
autoload -Uz vcs_info
autoload -Uz add-zsh-hook

zstyle ':vcs_info:*' formats '%F{green}(%s)-[%b]%f'
zstyle ':vcs_info:*' actionformats '%F{red}(%s)-[%b|%a]%f'

_vcs_init() {
	LANG=en_US.UTF-8 vcs_info
	RPROMPT="${vcs_info_msg_0_}"
}
add-zsh-hook precmd _vcs_init

# #################### option ####################
setopt print_eight_bit
setopt no_beep
setopt no_flow_control
setopt ignore_eof
setopt interactive_comments
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt share_history
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt extended_glob

# #################### plugin ####################
source ~/.zplug/init.zsh

# zsh-syntax-highlighting
zplug "zsh-users/zsh-syntax-highlighting", defer:2
# zsh-autosuggestions
zplug "zsh-users/zsh-autosuggestions"
# zsh-completions
zplug "zsh-users/zsh-completions"
# zsh-256color
zplug "chrissicool/zsh-256color"

if ! zplug check --verbose; then
	printf "Install? [y/N]: "
	if read -q; then
		echo; zplug install
	fi
fi

zplug load

# #################### complement ####################
fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' ignore-parents parent pwd ..
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'

# #################### binding ####################
bindkey '^R' history-incremental-pattern-search-backward

# #################### alias ####################
alias la='ls -a'
alias ll='ls -l'
case $OSTYPE in
	# macos
	darwin*)
		export CLICOLOR=1
		alias ls='ls -G -F'
		;;
	# linux
	linux*)
		alias ls='ls -F --color=auto'
		;;
esac

alias sudo='sudo '

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'

alias ..='cd ..'
alias ..2='cd ../..'
alias ..3='cd ../../..'

alias .='source ~/.zshrc'
alias zshrc='vi ~/.zshrc'
alias .z='zshrc'

alias .install='~/.dotapps/etc/install.sh'

# #################### profile ####################
if [ -f ~/.profile ]; then
	source ~/.profile
fi

if [ -d ~/.profile.d ]; then
	for profile in $(find ~/.profile.d -follow -name '*.sh'); do
		source $profile
	done
fi

# vim:set ft=zsh:
