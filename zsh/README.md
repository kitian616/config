# zsh配置说明

## install zsh

### macOS

```
brew install zsh zsh-completions
```

### Ubuntu, Debian

```
apt install zsh
```

### Arch Linux

```
pacman -S zsh
```

## install [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

## 安装 Powerline 字体

由于在`.zshrc`使用了`agnoster`主题，该主题依赖 Powerline fonts 字体，因此需要安装并在终端中配饰 Powerline 字体。

附：[安装文档](https://github.com/powerline/fonts)

终端的配置，以 iTerm 为例，Preferences -> Profiles -> Text标签 -> Change Font 选择方才安装的 `... for Powerline` 系列字体。
