alias zshconfig="code ~/.zshrc"
alias ls="ls --color=auto"
alias grep='grep --color=auto'
alias path='echo -e ${PATH//:/\\n}'

# Aliases
if [ -f "$HOME/.aliases.zsh" ]; then
    source "$HOME/.aliases.zsh"
fi
