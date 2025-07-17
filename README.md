# dotfiles

There are many like it, but this one is mine.

## Structure

This dotfiles setup uses a symlink approach:
- `~/bin` is symlinked to `~/Projects/dotfiles`
- Shell configs are in `~/Projects/dotfiles/dotfiles/`
- For zsh: `~/bin/dotfiles/zshrc` (not `~/.zshrc`)
- For bash: `~/bin/dotfiles/bashrc` (not `~/.bashrc`)
- Environment variables, aliases, etc. are split into separate files under `zsh/` or `bash/`


## New Machine Prep

Add Apple ID to machine

Settings -> Sharing -> Computer Name


## Usage

Install Homebrew:

    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

This will automatically prompt you to install the Xcode Command Line Tools. Install these then go back to Terminal and resume the Homebrew installation.

Make sure it’s working:

    brew doctor

From the command-line, clone this project:

    mkdir -p ~/Projects
    git clone https://github.com/burin/dotfiles.git ~/Projects/dotfiles

Install system dependencies defined in the [Brewfile](https://github.com/burin/dotfiles/blob/master/Brewfile):

    cd ~/Projects/dotfiles
    brew bundle

Setup the dotfiles:

    ~/Projects/dotfiles/bootstrap.sh

For zsh (macOS default):

    echo 'source ~/Projects/dotfiles/dotfiles/zshrc' >> ~/.zshrc

For bash:

    echo 'source ~/Projects/dotfiles/dotfiles/bashrc' >> ~/.bash_profile

Open a new Terminal

##### You’re done!

Check out the new apps you have installed:

    find ~/Applications -cmin -60

Try [one of the cool aliases](https://github.com/burin/dotfiles/blob/master/dotfiles/zsh/updaters):

    update

## Configuring Mac OS

This command will close a bunch of your apps, including Terminal. So do this at the end:

    . ~/Projects/dotfiles/.macos

Other things to remember that the `.macos` script doesn't handle for you:

* Terminal > Preferences > Profiles > Keyboard > Use Option as Meta key
* Keychain Access > Preferences > Show keychain status in menu bar
* System Preferences > Trackpad > Check every single box in every section
* If a desktop or server Mac: System Preferences > Energy Saver > Computer sleep > Never
* Open DropBox and sign in > Choose folders to sync > Start unchecking everything except:
  * 1Password
  * Temp
  * TextExpander
* Wait until all Dropbox files are downloaded (this'll take about 10 minutes)
* Open 1Password keychain from DropBox `open ~/Dropbox/1Password/1Password.agilekeychain`
* Start configuring all the software that requires licenses, getting the licenses from DropBox
