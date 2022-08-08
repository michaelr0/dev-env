# Development Config

`install.sh` will do the following:

- Disable preinstalled Apache in Mac OS
- Install Homebrew
- Install Starship (ZSH)
- Install PHP 7.4, 8.0 & 8.1
- Install Composer
- Install PNPM, NPM, YARN
- Install NVM (Default to NPM LTS)
- Install FiraCode Nerd Font
- Install Wget
- Install Htop
- Install NCDU
- Install Hyperfine
- Install visual-studio-code
- Install gitkraken
- Install iterm2
- Install phpstorm
- Install tableplus
- Install memcached
- Install redis
- Install wp-cli
- Install laravel/installer
- Install statamic/cli
- Install friendsofphp/php-cs-fixer
- Install laravel/valet
- Install mariadb
- Set MariaDB root password to blank/empty
- Create Sites directory in Users Home folder
- Install phpmyadmin
- Install mailhog

## Installation

Clone the repo.
```sh
cd "$HOME"
git clone https://github.com/michaelr0/dev-env
```

Then run the install script.
```sh
cd "$HOME/dev-env"
./install.sh
```

You should then manually update the font configuration for the following applications.
### VS Code
Set the font for the editor and built-in terminal to `'FiraCode Nerd Font', Menlo, Monaco, 'Courier New', monospace`
![image](https://user-images.githubusercontent.com/54159303/183346814-470232bf-6ce7-49ca-a8cc-396622eaca7e.png)
![image](https://user-images.githubusercontent.com/54159303/183346758-ffea5736-3f03-4177-9d00-5246bf29cc58.png)

### Mac OS Terminal
Set the font to `Fira Code Regular Nerd Font Complete 11`
![image](https://user-images.githubusercontent.com/54159303/182966469-ccfe31ea-b28e-4a3b-804c-d52a73241b65.png)

### iTerm2
Set the font to `FiraCode Nerd Font Regular 12`
![image](https://user-images.githubusercontent.com/54159303/182966262-7cfaab92-ad83-40dc-881e-48731fc0bb80.png)
