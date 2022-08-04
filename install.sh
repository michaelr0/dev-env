#!/bin/zsh

# Disable default Mac OS Apache
sudo apachectl stop
sudo launchctl unload "/System/Library/LaunchDaemons/org.apache.httpd.plist" 2>/dev/null

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Prepare Composer directories
mkdir -p "$HOME/.composer/vendor/bin"

# Setup ZSH
cp "zsh/zshrc.zsh" "$HOME/.zshrc"
cp "zsh/zprofile.zsh" "$HOME/.zprofile"

# Install Starship
brew install starship

# Install PNPM, NPM, YARN
brew install pnpm npm yarn
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | zsh

# Load ZSH
source "$HOME/.zprofile"
source "$HOME/.zshrc"

# Setup default NPM
nvm install --lts

# Install Utils
brew install wget htop ncdu hyperfine
brew install --cask visual-studio-code gitkraken

# Install PHP
brew install php@7.4 php@8.0 php@8.1

# Install Composer
brew install composer

# Install Memcached & Redis
brew install memcached redis

# Install WP CLI
brew install wp-cli

# Install Laravel CLI
composer global require laravel/installer

# Install Statamic CLI
composer global require statamic/cli

# Install php-cs-fixer
composer global require friendsofphp/php-cs-fixer

# Install Valet
composer global require laravel/valet
valet install
valet trust
valet start

# Install MariaDB
brew install mariadb
brew services restart mariadb
mysql -e "SET PASSWORD FOR 'root'@'localhost' = '';"

# Create Sites Directory
mkdir -p "$HOME/Sites"

# Install phpMyAdmin
if [ ! -d "$HOME/Sites/phpmyadmin" ]; then
    composer create-project phpmyadmin/phpmyadmin --repository-url=https://www.phpmyadmin.net/packages.json --no-dev "$HOME/Sites/phpmyadmin"
    cp "phpmyadmin/config.inc.php" "$HOME/Sites/phpmyadmin/config.inc.php"

    cd "$HOME/Sites/phpmyadmin"
    valet link phpmyadmin --secure
fi

# Install MailHog
brew install mailhog

# Finished
echo "Installed MailHog: http://localhost:8025"
echo "MailHog SMTP: localhost:1025"
echo "\r\n"
echo "Installed phpMyAdmin: https://phpmyadmin.test"