# Ayo's various configuration files

Clone the repo

```bash
git clone git@github.com:ayoayco/dotfiles
```

Then symlink to correct places. For example, the `.vimrc` usually goes to user home directory

```bash
cd dotfiles
ln -rsf ./.vimrc ~/
```

## For vim, vundle is used
1. install vundle

```bash
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

2. open `vim` then run `:PluginInstall`

[See more](https://github.com/VundleVim/Vundle.vim?tab=readme-ov-file#quick-start)

