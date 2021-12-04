# Bare git repository to keep track of config in home folder
alias config='git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

# Color coded ls
alias ls='ls --color=auto'

# Syntax highlighting for cat
alias cat='bat -p'

# Follow symbolic links
alias cd='cd -P'

# Good for things like mutt
export EDITOR="nvim"

# Nice looking bash prompt
PS1="\n\[\e[2;33m\][ \w ]\[\e[0m\] "
