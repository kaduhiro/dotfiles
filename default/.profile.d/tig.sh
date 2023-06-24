# tig
alias tig='tig --all'
alias tigd='f(){d=${1:-.} && cd "$d" && tig && cd - > /dev/null};f'
alias .tig='cd ~/.dotapps/home/dotfiles@kaduhiro && tig && cd - > /dev/null'
