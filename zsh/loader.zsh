# Exports
export EDITOR='nano'

# Functions
if [ -f "$HOME/dev-env/zsh/functions.zsh" ]; then
    source "$HOME/dev-env/zsh/functions.zsh"
fi

# Completion
autoload -Uz compinit
compinit

# Starship
if [ -x "$(which starship)" ]; then
    eval "$(starship init zsh)"
fi

# NVM
if [ -d "$HOME/.nvm" ]; then
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi
