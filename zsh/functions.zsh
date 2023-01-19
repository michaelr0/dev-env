# dev-env update
function devenv-update() {
    zsh -c "cd $HOME/dev-env && git pull && git submodule update"
}

# php-cs-fixer fix command with config automatically applied
function phpfmt() {
    if [ -x "vendor/bin/php-cs-fixer" ]; then
        EXEC_BIN="vendor/bin/php-cs-fixer"
    else
        EXEC_BIN="$(which php-cs-fixer)"
    fi

    if [ -x $EXEC_BIN ]; then
        $EXEC_BIN fix --config="$HOME/dev-env/php-cs-fixer.dist.php" $@
    else
        echo "PHP CS Fixer not found!"
    fi
}

# PHPUNIT
function phpunit() {
    if [ -x "vendor/bin/phpunit" ]; then
        EXEC_BIN="vendor/bin/phpunit"
    else
        EXEC_BIN="$(which phpunit)"
    fi

    if [ -x $EXEC_BIN ]; then
        $EXEC_BIN $@
    else
        echo "PHPUnit not found!"
    fi
}

# Laravel Sail
function sail() {
    if [ -x "sail" ]; then
        EXEC_BIN="sail"
    elif [ -f "vendor/bin/sail" ]; then
        EXEC_BIN="vendor/bin/sail"
    else
        EXEC_BIN="$(which sail)"
    fi

    if [ -x $EXEC_BIN ]; then
        $EXEC_BIN $@
    else
        echo "Laravel Sail not found!"
    fi
}

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

# Functions
if [ -f "$HOME/.functions.zsh" ]; then
    source "$HOME/.functions.zsh"
fi
