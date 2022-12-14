#!/bin/zsh

# Install Rosetta 2
/usr/sbin/softwareupdate --install-rosetta --agree-to-license

# Disable default Mac OS Apache
sudo apachectl stop
sudo launchctl unload "/System/Library/LaunchDaemons/org.apache.httpd.plist" 2>/dev/null

# Load Git Modules
git submodule init
git submodule update

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Prepare Composer directories
mkdir -p "$HOME/.composer/vendor/bin"

# Setup ZSH
echo '[ -f "$HOME/dev-env/zsh/zprofile.loader.zsh" ] && source "$HOME/dev-env/zsh/zprofile.loader.zsh"' >> "$HOME/.zprofile"
echo '[ -f "$HOME/dev-env/zsh/zsh.loader.zsh" ] && source "$HOME/dev-env/zsh/zsh.loader.zsh"' >> "$HOME/.zshrc"

# Load ZSH
source "$HOME/.zprofile"
source "$HOME/.zshrc"

# Install Starship
brew install starship
cp "config/starship.toml" "$HOME/.config/starship.toml"

# Install PNPM, NPM, YARN
brew install pnpm npm yarn
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/HEAD/install.sh | zsh

# Reload ZSH
source "$HOME/.zprofile"
source "$HOME/.zshrc"

# Setup default NPM
nvm install --lts

# Install fonts
brew tap homebrew/cask-fonts
brew install --cask font-fira-code-nerd-font

# Install Utils
brew install wget htop ncdu hyperfine
brew install --cask visual-studio-code gitkraken iterm2 phpstorm

# Install Docker Desktop
brew install --cask docker

# Install PHP
brew install php@7.4 php@8.0 php@8.1

# Install Composer
brew install composer

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

# Install MailHog
brew install mailhog
brew services restart mailhog

# Install MariaDB
brew install mariadb
brew services restart mariadb
mysql -e "SET PASSWORD FOR 'root'@'localhost' = '';"
brew services restart mariadb
mysql -e "DROP DATABASE IF EXISTS test;"

# Create Sites Directory
mkdir -p "$HOME/Sites"

# Install phpMyAdmin
if [ ! -d "$HOME/Sites/phpmyadmin" ]; then
    composer create-project phpmyadmin/phpmyadmin --repository-url=https://www.phpmyadmin.net/packages.json --no-dev "$HOME/Sites/phpmyadmin"
    cp "config/phpmyadmin.php" "$HOME/Sites/phpmyadmin/config.inc.php"

    cd "$HOME/Sites/phpmyadmin"
    valet link phpmyadmin --secure

    # mysql -e "CREATE DATABASE IF NOT EXISTS phpmyadmin DEFAULT CHARACTER SET = 'utf8' COLLATE = 'utf8_bin';"
    # mysql -uroot phpmyadmin < "$HOME/Sites/phpmyadmin/sql/create_tables.sql"

    mysql -e "$(cat $HOME/Sites/phpmyadmin/sql/create_tables.sql)"
fi

# Finished
cd "$HOME/Sites"
echo "Installed MailHog: http://localhost:8025"
echo "MailHog SMTP: localhost:1025"
echo "\r\n"
echo "Installed phpMyAdmin: https://phpmyadmin.test"
echo "\r\n"
echo "Installation finished, please restart."
