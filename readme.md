# Dotfiles

For instalation, run:
```sh
./install.sh
```


## Get `renv` works with `Nvim-R`

1. Create a new folder containing a link pointing to `nvimcom` package:

```sh
mkdir ~/R/renvExt
ln -s ~/R/x86_64-pc-linux-gnu-library/4.1/nvimcom/ ~/R/renvExt/nvimcom
ln -s ~/R/x86_64-pc-linux-gnu-library/4.1/JD.Templates/ ~/R/renvExt/JD.Templates
ln -s ~/R/x86_64-pc-linux-gnu-library/4.1/prompt/ ~/R/renvExt/prompt
ln -s ~/R/x86_64-pc-linux-gnu-library/4.1/colorout/ ~/R/renvExt/colorout
ln -s ~/R/x86_64-pc-linux-gnu-library/4.1/microbenchmark/ ~/R/renvExt/microbenchmark
ln -s ~/R/x86_64-pc-linux-gnu-library/4.1/languageserver/ ~/R/renvExt/languageserver
```





1. Specify this new library in the `.Renviron` file

```
echo 'RENV_CONFIG_EXTERNAL_LIBRARIES="~/R/renvExt' >> ~/.Renviron
```
