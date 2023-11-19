# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# other custom PATH:
if [ -d "$HOME/anaconda3/bin" ] ; then
    PATH="$HOME/anaconda3/bin:$PATH"
fi
if [ -d "$HOME/anaconda3/bin" ] ; then
    PATH="$HOME/anaconda3/bin:$PATH"
fi


# Manually installed TexLive
if [ -d "/usr/local/texlive/2022" ] ; then
    PATH="/usr/local/texlive/2022/bin/x86_64-linux:$PATH"
    MANPATH="/usr/bin/local/texlive/2022/texmf-dist/doc/man:$MANPATH"
    INFOPATH="/usr/bin/local/texlive/2022/texmf-dist/doc/info:$INFOPATH"
fi




# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export VISUAL='nvim'
  export EDITOR=$VISUAL
  export SUDO_EDITOR=$VISUAL
fi


# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export QT_QPA_PLATFORMTHEME=qt6ct
