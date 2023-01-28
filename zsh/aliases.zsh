alias zshconfig="code ~/.zshrc"
alias ls="ls --color=auto"
alias grep='grep --color=auto'
alias path='echo -e ${PATH//:/\\n}'

PHP_VERSIONS=(7.4 8.0 8.1 8.2)

for PHP_VER in $PHP_VERSIONS
do
    if [ -x "${HOMEBREW_PREFIX}/opt/php@${PHP_VER}/bin/php" ]; then
        alias "php${PHP_VER//./}"="${HOMEBREW_PREFIX}/opt/php@${PHP_VER}/bin/php"

        if [ -x "${HOMEBREW_PREFIX}/bin/composer" ]; then
            alias "composer${PHP_VER//./}"="php${PHP_VER//./} ${HOMEBREW_PREFIX}/bin/composer"
        fi
    fi
done

# Aliases
if [ -f "$HOME/.aliases.zsh" ]; then
    source "$HOME/.aliases.zsh"
fi
