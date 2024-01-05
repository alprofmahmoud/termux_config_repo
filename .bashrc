# Aliases
alias ls="lsd $argv"
alias ll="lsd -lh $argv"
alias la="lsd -a $argv"
alias rmv="rm -rf $argv"
alias nsdv="$PATH/nsdv/main.sh"
alias pkgi="pkg install $argv"
alias pkgrm="pkg remove $argv"

# Variable in system
PS1='\[\e[31m\][\[\e[m\]\[\e[38;5;172m\]\u\[\e[m\]@\[\e[38;5;153m\]\h\[\e[m\] \[\e[38;5;214m\]\W\[\e[m\]\[\e[31m\]]\[\e[m\]\\$ '
#[u0_a368@localhost ~]$

figlet -f $HOME/.config/big.flf "Pro"
echo "Hello Pro"
#This is bashrc file.
