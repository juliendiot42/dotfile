# Dotfiles

For instalation, run:
```sh
./install.sh
```


## Get `renv` works with `Nvim-R`

1. Create a new folder containing a link pointing to `nvimcom` package:

```sh
mkdir ~/R/nvimcomlib
ln -s ~/R/x86_64-pc-linux-gnu-library/4.1/nvimcom/ ~/R/nvimcomlib/nvimcom
```

1. Specify this new library in the `.Renviron` file

```
echo 'RENV_CONFIG_EXTERNAL_LIBRARIES="~/R/nvimcomlib"' >> ~/.Renviron
```
