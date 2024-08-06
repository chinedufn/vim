# chinedufn/vim

This repository is designed for my personal use.

```sh
# coc.nvim uses node.js
# if node.js is not already installed
https://nodejs.org/en/download/package-manager
```

```sh
git clone git@github.com:chinedufn/vim.git
ln -s "$(pwd)/vim" ~/.chinedufn-vim

cd ./vim
git submodule update --init --recursive

# Install CoC
$(cd ./.vim/pack/vendor/start && curl --fail -L https://github.com/neoclide/coc.nvim/archive/release.tar.gz | tar xzfv -)

# Install rust-analyzer
vim -c ":CocInstall coc-rust-analyzer" -c "1" -c "q"

# Open vim to confirm that it works without errors
vim -u ./.vimrc
```

```sh
# Bash profile

vim="vim -u ~/.chinedufn-vim/.vimrc"
```

## Installing new plugins

```sh
cd .vim/pack/vendor/start
git submodule add REPOSITORY
```
