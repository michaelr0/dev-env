# Development Config

`install.sh` will do the following:

- [Disable preinstalled Apache in Mac OS](https://apple.stackexchange.com/questions/119674/disable-apache-autostart)
- Install [Homebrew](https://brew.sh/)
- Install [Starship](https://starship.rs/) (ZSH)
- Install Dnsmasq
- Install [NGINX](https://docs.nginx.com/)
- Install PHP (Including FPM) 7.4, 8.0, 8.1 & [Composer](https://getcomposer.org/)
- Install [PnPM](https://pnpm.io/motivation), [npm cli](https://docs.npmjs.com/), [Yarn](https://yarnpkg.com/getting-started) & [nvm](https://github.com/nvm-sh/nvm) (Default to npm LTS)
- Install [FiraCode Nerd Font](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/FiraCode)
- Install Wget, [htop](https://github.com/htop-dev/htop), ncdu (NCurses Disk Usage) cli tools
- Install [Hyperfine](https://github.com/sharkdp/hyperfine) benchmark cli
- Install Visual Studio Code, PhpStorm
- Install GitKraken
- Install iTerm2
- Install [Laravel Installer](https://laravel.com/docs/8.x#the-laravel-installer), [Statamic CLI](https://statamic.dev/installing/local#install-statamic)
- Install [WP-CLI](https://wp-cli.org/)
- Install [PHP-CS-Fixer](https://github.com/FriendsOfPHP/PHP-CS-Fixer)
- Install [Laravel Valet](https://laravel.com/docs/9.x/valet)
- Install [Docker Desktop](https://www.docker.com/products/docker-desktop/)
- Install MariaDB
- Set MariaDB root password to blank/empty
- Create Sites directory in Users Home folder
- Install [phpMyAdmin](https://phpmyadmin.test/)
- Install [MailHog](http://localhost:8025/)

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

### Docker Desktop
#### Install Helper
Click `ok` then enter your password and click `Install Helper`
![image](https://user-images.githubusercontent.com/54159303/183357877-750baebb-7e24-4587-a71c-b46cc995dc3e.png)

#### Limit VM Resources
You will want to limit the disk image size that Docker Desktop can use.
Then click `Apply & Restart` and confirm the resize action.
![image](https://user-images.githubusercontent.com/54159303/183358297-b3e308b9-a537-4d1f-84d8-0fc9ba5278a3.png)

#### Install Extensions
Install the `Disk Usage` and `Logs Explorer` extensions.
![image](https://user-images.githubusercontent.com/54159303/183358628-88bc5c13-da07-4773-a0b3-a56366589ce1.png)


You should then manually update the font configuration for the following applications.
### VS Code
Set the font for the editor and built-in terminal to `'FiraCode Nerd Font', Menlo, Monaco, 'Courier New', monospace`
![image](https://user-images.githubusercontent.com/54159303/183346814-470232bf-6ce7-49ca-a8cc-396622eaca7e.png)
![image](https://user-images.githubusercontent.com/54159303/183346758-ffea5736-3f03-4177-9d00-5246bf29cc58.png)

### PhpStorm
Set the font for the editor to `FiraCode Nerd Font 13`
![image](https://user-images.githubusercontent.com/54159303/183359281-06f61b9f-95fa-476b-9dab-6d282c0a3dd3.png)

### Mac OS Terminal
Set the font to `Fira Code Regular Nerd Font Complete 11`
![image](https://user-images.githubusercontent.com/54159303/182966469-ccfe31ea-b28e-4a3b-804c-d52a73241b65.png)

### iTerm2
Set the font to `FiraCode Nerd Font Regular 12`
![image](https://user-images.githubusercontent.com/54159303/182966262-7cfaab92-ad83-40dc-881e-48731fc0bb80.png)

