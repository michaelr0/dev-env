# Homebrew
if [ -x "/opt/homebrew/bin/brew" ]; then # ARM
  BREW="/opt/homebrew/bin/brew"
elif [ -x "/usr/local/bin/brew" ]; then # INTEL
  BREW="/usr/local/bin/brew"
fi

if [ -x "$BREW" ]; then
  eval "$($BREW shellenv)"
  FPATH="${HOMEBREW_PREFIX}/share/zsh/site-functions:${FPATH}"
fi

# Composer
if [ -d "$HOME/.composer/vendor/bin" ]; then
    export PATH="$HOME/.composer/vendor/bin:$PATH"
fi

# PNPM
if [ -d "$HOME/Library/pnpm" ]; then
    export PNPM_HOME="$HOME/Library/pnpm"
    export PATH="$PNPM_HOME:$PATH"
fi

# Plugins
if [ -f "$HOME/dev-env/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
    source "$HOME/dev-env/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi
