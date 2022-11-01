# Load .zprofile if not loaded
if [[ ! -v BREW ]]; then
    source "$HOME/.zprofile"
fi

# Aliases
if [ -f "$HOME/dev-env/zsh/aliases.zsh" ]; then
    source "$HOME/dev-env/zsh/aliases.zsh"
fi

# Exports
if [ -f "$HOME/dev-env/zsh/exports.zsh" ]; then
    source "$HOME/dev-env/zsh/exports.zsh"
fi

# Functions
if [ -f "$HOME/dev-env/zsh/functions.zsh" ]; then
    source "$HOME/dev-env/zsh/functions.zsh"
fi

if [[ -o interactive ]]; then
    if [ -f "$HOME/dev-env/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
        source "$HOME/dev-env/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
    fi

    # Completion
    autoload -Uz compinit
    compinit

    # Starship
    if [ -x "$(which starship)" ]; then
        eval "$(starship init zsh)"
    fi
fi

# NVM
if [ -d "$HOME/.nvm" ]; then
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi
