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

# PHP 7.4
function php74() {
    EXEC_BIN="$HOMEBREW_PREFIX/opt/php@7.4/bin/php"

    if [ -x "$EXEC_BIN" ]; then
        $EXEC_BIN $@
    else
        echo "$EXEC_BIN not found!"
    fi
}

# PHP 8.0
function php80() {
    EXEC_BIN="$HOMEBREW_PREFIX/opt/php@8.0/bin/php"

    if [ -x "$EXEC_BIN" ]; then
        $EXEC_BIN $@
    else
        echo "$EXEC_BIN not found!"
    fi
}

# PHP 8.1
function php81() {
    EXEC_BIN="$HOMEBREW_PREFIX/opt/php@8.1/bin/php"

    if [ -x "$EXEC_BIN" ]; then
        $EXEC_BIN $@
    else
        echo "$EXEC_BIN not found!"
    fi
}

# Functions
if [ -f "$HOME/.functions.zsh" ]; then
    source "$HOME/.functions.zsh"
fi
