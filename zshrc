# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

neofetch

umask 007
#setopt correct

source /etc/profile
source ~/.profile

# I suggest to modify the PATH variable in the ~/.profile file 
# so that it is consistent with other shell (eg. bash)

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

source $HOME/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# source $HOME/.zsh-autocomplete/zsh-autocomplete.plugin.zsh
# export PATH="$HOME/anaconda3/bin:$PATH"  # commented out by conda initialize


# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="pure"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# pure theme: Do not enable the following (incompatible) plugins: vi-mode, virtualenv.
plugins=(git sudo python colorize aliases vi-mode z)

VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true
VI_MODE_SET_CURSOR=true

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8


# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#

# # Some environment variable
# export GEM_HOME=$HOME/.gems
# export RUBYOPT=-rubygems





# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias :q='exit'

alias vim="nvim"
alias vimconf="nvim  -c \"cd ~/.config/nvim\" ~/.config/nvim/"
alias aptup="sudo apt update && apt list --upgradable"
alias aptupg="sudo apt upgrade"
alias aptin="sudo apt install"
alias aptrm="sudo apt purge"

alias cp="cp -i"
alias mv="mv -i"

alias gitfuckit="git commit -a -m \"¯\\_(ツ)_/¯\""
alias gitlog="git log --all --decorate --oneline --graph"
alias checkPorts="sudo lsof -i -P -n | grep LISTEN"

alias R="R --no-save --no-restore"

# anaconda3 overwrite pandoc so:
# alias pandoc="/usr/bin/pandoc"

# workon/off functions
setopt NO_HUP # avoid zsh to kill background process
setopt NO_CHECK_JOBS # no messages about running job

alias workon="sh ~/Documents/Work/GitRepos/dotfile/utils_scripts/workon.sh"
alias workoff="sh ~/Documents/Work/GitRepos/dotfile/utils_scripts/workoff.sh"


# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
