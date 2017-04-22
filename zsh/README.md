# zsh配置说明

使用 [zgen](https://github.com/tarjoilija/zgen) 来管理 zsh 插件。

![screenshot](https://github.com/kitian616/config/blob/master/zsh/screenshot.png?raw=true)

## install zsh

### macOS

```
$ brew install zsh zsh-completions
```

### Ubuntu, Debian

```
$ apt install zsh
```

### Arch Linux

```
$ pacman -S zsh
```

## zgen

```
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

因为在`.zshrc`使用了`agnoster`主题，而该主题依赖 Powerline 字体，所以需要安装并在终端中配置该字体。

附：[安装文档](https://github.com/powerline/fonts)

终端的配置，以 iTerm 为例，Preferences -> Profiles -> Text标签 -> Change Font 选择方才安装的 `... for Powerline` 系列字体。


## 安装 iTerm2 color theme

截图中使用的是 [Dracula](https://draculatheme.com/) 主题，你可以选择自己喜欢的终端和主题。
