# fetch all zsh aliases 
alias | awk -F'[ =]' '{print $1}'

# fetch all zsh functions
print -l ${(ok)functions}
