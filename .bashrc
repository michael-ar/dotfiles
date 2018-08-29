parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\u \W\[$(tput sgr0)\] \$(parse_git_branch) \[\033[00m\] "
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
