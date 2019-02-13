# Config

## 准备工作

### Install nvm, pyenv, rbenv

[nvm](https://github.com/creationix/nvm)，[pyenv](https://github.com/yyuu/pyenv)，[rbenv](https://github.com/rbenv/rbenv) 分别为 Node.js，Python，Ruby 的版本管理工具，提供了版本下载安装和版本切换的功能，推荐使用这样的版本管理工具来管理 Node.js，Python，Ruby 等开发环境。

Node.js，Python 和 Ruby 是很多开源工具所依赖的环境，最好一开始就将这些环境配置好。当然还有 gcc，g++，make 这样的工具，这些工具在 Unix/Linux 上都是很容易获得的。

java 也有类似的版本管理工具[jenv](https://github.com/gcuisinier/jenv)，但它并不提供下载的功能。

#### nvm

```bash
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
```

#### macOS

```bash
brew install pyenv
brew install rbenv
```

#### Ubuntu, Debian

```bash
apt install pyenv
apt install rbenv
```

#### Arch Linux

```bash
pacman -S pyenv
pacman -S rbenv
```

#### 终端环境的配置

为了能够使用上述的工具，需要对终端环境(bash/zsh)进行配置。（本项目的 `_zshrc` 文件已经对它们进行了配置）

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

## Vim，Zsh 的配置

见 vim， Zsh 目录 README。

## 安装配置

在进行了上述的步骤和每个配置的步骤之后就可以使用该配置了。

当然，你也可以根据自己的喜好进行配置。

```bash
git clone https://github.com/kitian616/config.git ~/.tq_config
ln -s ~/.tq_config/vim/_vimrc ~/.vimrc
ln -s ~/.tq_config/zsh/_zshrc ~/.zshrc
ln -s ~/.tq_config/lint/htmlhint/_htmlhintrc ~/.htmlhintrc
ln -s ~/.tq_config/lint/stylelint/_stylelintrc ~/.stylelintrc
ln -s ~/.tq_config/lint/eslint/_eslintrc ~/.eslintrc
ln -s ~/.tq_config/lint/textlint/_textlintrc ~/.textlintrc
```

带 ES6 规则和 ES2016 支持的 ESLint 配置。

```bash
ln -s ~/.tq_config/lint/eslint/_eslintrc_es2016 ~/.eslintrc_es2016
```

## Lint 的配置

见 *lint* 目录的 *README.md*。

## 更新

```bash
cd ~/.tq_config && git pull && cd -
```
