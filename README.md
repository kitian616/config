# 配置说明文档

## 准备工作

### install nvm, pyenv, rbenv

[nvm](https://github.com/creationix/nvm)，[pyenv](https://github.com/yyuu/pyenv)，[rbenv](https://github.com/rbenv/rbenv) 分别为 node，python，ruby 的版本管理工具，提供了版本下载安装和版本切换的功能，推荐使用这样的版本管理工具来管理 node 等开发环境。

node，python 和 ruby 是很多开源工具所依赖的环境，最好一开始就将这些环境配置好。当然还有 gcc，g++，make 这样的工具，这些工具在 unix/linux 上都是很容易获得的。

java 也有类似的版本管理工具[jenv](https://github.com/gcuisinier/jenv)，但它并不提供下载的功能。

#### macOS

```
$ brew install nvm
$ brew install pyenv
$ brew install rbenv
```

#### Ubuntu, Debian

```
$ apt install nvm
$ apt install pyenv
$ apt install rbenv
```

#### Arch Linux

```
$ pacman -S nvm
$ pacman -S pyenv
$ pacman -S rbenv
```

#### 终端环境的配置

为了能够使用上述的工具，需要对终端环境(bash/zsh)进行配置。（zshrc 文件已经对它们进行了配置）

##### nvm

```bash
export NVM_DIR="$HOME/.nvm" && (
  git clone https://github.com/creationix/nvm.git "$NVM_DIR"
  cd "$NVM_DIR"
  git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" origin`
) && . "$NVM_DIR/nvm.sh"
```

##### pyenv

```bash
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
```

##### rbenv

```bash
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
```

## vim，zsh的配置

见 vim， zsh 目录 README。

## 安装

在进行了上述的步骤和每个配置的步骤之后就可以使用该配置了。

```
$ git clone https://github.com/kitian616/config.git ~/.tq_config
$ ln -s ~/.tq_config/vim/_vimrc ~/.vimrc
$ ln -s ~/.tq_config/zsh/_zshrc ~/.zshrc
$ ln -s ~/.tq_config/lint/htmlhint/_htmlhintrc ~/.htmlhintrc
$ ln -s ~/.tq_config/lint/csscomb/_csscomb.json ~/.csscomb.json
$ ln -s ~/.tq_config/lint/eslint/_eslintrc ~/.eslintrc
```

## hint的配置

见 lint 目录的 READEME。

## 更新

```
$ cd ~/.tq_config && git pull && cd -
```
