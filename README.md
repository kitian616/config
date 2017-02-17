[Thomas Tian](http://www.thomastian.com)'s config files, include zsh, vim

## vim

### install [vundle](https://github.com/gmarik/Vundle.vim)

#### Linux/Unix

```
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

#### Windows

```
git clone https://github.com/gmarik/Vundle.vim.git %HOMEPATH%/vimfiles/bundle/Vundle.vim
```

PluginList is shown in vimrc file.

### Install Plugins

```
:PluginInstall
```

## zsh

### install zsh

#### macOS

```
brew install zsh zsh-completions
```

#### Ubuntu, Debian

```
apt install zsh
```

#### Arch Linux

```
pacman -S zsh
```

### install [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

### install nvm, pyenv, rbenv

```
brew install nvm
brew install pyenv
brew install rbenv
```

