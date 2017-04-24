# zsh配置说明

使用 [zgen](https://github.com/tarjoilija/zgen) 来管理 zsh 插件。

![screenshot](https://github.com/kitian616/config/blob/master/zsh/screenshot.jpg?raw=true)

## install zsh

### macOS

```
brew install zsh
```

### Ubuntu, Debian

```
apt install zsh
```

### Arch Linux

```
pacman -S zsh
```

## zgen

### installation

```bash
git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"
```

### plugins

```bash
brew install coreutils jq fzf
```

### reset

```bash
zgen reset
```

### Update all plugins and reset

```
zgen update
```

### Update zgen

```
zgen selfupdate
```

## 安装 Powerline 字体

很多 zsh 主题都依赖 Powerline 字体，为了方便使用不同的主题，需要安装并配置好 Powerline 字体。

附：[安装文档](https://github.com/powerline/fonts)

终端的配置，以 iTerm 为例，Preferences -> Profiles -> Text标签 -> Change Font 选择方才安装的 `... for Powerline` 系列字体。


## 安装 iTerm2 color theme

截图中使用的是 [Dracula](https://draculatheme.com/) 主题，你可以选择自己喜欢的终端和主题。
