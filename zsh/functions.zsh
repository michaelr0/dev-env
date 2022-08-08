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
