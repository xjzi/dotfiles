# Bare git repository to keep track of config in home folder
#alias config='git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
alias config='git --git-dir=$HOME/.config/dotfiles/ --work-tree=$HOME'
alias ls='ls --color=auto'
alias cat='bat -p'
# Follow symbolic links
alias cd='cd -P'
# Copy the whole directory
alias cp='cp -r'

# Cleaning up home directory
export LESSHISTFILE=/dev/null
alias mutt='mutt -F $HOME/.config/muttrc'

export EDITOR="nvim"
PS1="\n\[\e[2;33m\][ \w ]\[\e[0m\] "
