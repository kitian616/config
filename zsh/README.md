# Zsh Config

![screenshot](https://github.com/kitian616/config/blob/master/zsh/screenshot.jpg?raw=true)

## Install Zsh

### macOS

```bash
xcode-select –install
brew install zsh
```

### Ubuntu, Debian

```bash
apt install zsh
```

### Arch Linux

```bash
pacman -S zsh
```

### 修改默认 shell 为 zsh

查看已安装 shell

```bash
cat /etc/shells
```

设置默认 shell

```bash
chsh -s /bin/zsh
```

## 安装 Powerline 或 Nerd 字体

很多 Zsh 主题都依赖 Powerline 或 Nerd 字体，为了方便使用不同的主题，需要安装并配置好 Powerline 或 Nerd 字体。

[Powerline](https://github.com/powerline/fonts)

[Nerd](https://www.nerdfonts.com/font-downloads)

终端的配置，以 iTerm 为例，Preferences -> Profiles -> Text 标签 -> Change Font 选择方才安装的 Powerline 或 Nerd 字体。

## 安装 iTerm2 color theme

截图中使用的是 [Dracula](https://draculatheme.com/) 主题，你可以选择自己喜欢的终端和主题。

## 插件管理

使用 [zplug](https://github.com/zplug/zplug) 来管理 Zsh 插件。

更新所有插件：

```bash
zplug update
```
