git repo to store my vim and bash scripts and other settings

clone repo to HOME folder and symlink .vimrc and .bashrc
```
$ cd
$ ln -s linux_env/.bashrc .
$ ln -s linux_env/.vimrc .
$ ln -s linux_env .vim
```

`linux_env/bin` contains some common commands and is in path, for local bin `~/bin` is in path, so you can symlink various binaries there.
