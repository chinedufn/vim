# chinedufn/vim

This repository is meant for my personal use and as such is not well documented.

```sh
git clone --recurse-submodules -j8 git@github.com:chinedufn/vim.git
ln -s ./vim ~/.chinedufn-vim

cd ./vim

# Install CoC
$(cd ./.vim/pack/vendor/start && curl --fail -L https://github.com/neoclide/coc.nvim/archive/release.tar.gz | tar xzfv -)

# Install rust-analyzer
vim -c ":CocInstall coc-rust-analyzer" -c "1" -c "q"

vim -u ./
```

```sh
# Bash profile

vim="vim -u /path/to/chinedufn/vim"
```
