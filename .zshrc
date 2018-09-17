# Paths
export ZSH=/Users/michaelreynolds/.oh-my-zsh
export PATH=$HOME/bin:/usr/local/bin:$PATH
export DISABLE_AUTO_TITLE="true"
ZSH_THEME="hyperzsh"

# Plugins
plugins=(git kubectl npm)

source $ZSH/oh-my-zsh.sh

# Set editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='code'
else
  export EDITOR='code'
fi

alias reload='exec -l "$SHELL"'
alias git=hub
alias speed='speedtest-cli --simple'
alias ls='ls -lahG'
alias top='sudo htop'

# Import partials
. ./docker.sh
. ./git.sh
