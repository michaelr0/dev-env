# php-cs-fixer fix command with config automatically applied
function phpfmt() {
    php-cs-fixer fix --config="$HOME/dev-env/php-cs-fixer.dist.php" $@
}
