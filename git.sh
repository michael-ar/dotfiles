 # lists your previous work day's git activity
function yesterday() {
  local DAYS_BACK=1
  if [ $# -eq 1 ]; then
    DAYS_BACK=$1
  else
    local DOW
    DOW=$(date +%u)
    if [ "$DOW" -eq 1 ]; then
      DAYS_BACK=3
    fi
  fi
  local pager
  pager=$(git config --global core.pager)
  git config --global core.pager cat
  for D in *; do
    if [ -d "${D}" ]; then
        if [ -e "$D/.git" ]; then
            if [[ $(cd "${D}" && git log --all --since=${DAYS_BACK}.day --author="$(git config user.name)" 2>&1) ]]; then
              fD=$(echo "$D" | tr /a-z/ /A-Z/ | sed 's/-/ /g')
              (echo "\033[1;0;37;4m${fD}"  && cd "${D}" && git log --all --pretty=format:'%Cgreen%cd%Creset -%C(yellow)%d%Creset %s %Creset' --date=format:'%d %b %H:%M:%S' --abbrev-commit --since="${DAYS_BACK}".day --author="$(git config user.name)" && printf "\n")
            fi
        fi
    fi
  done
  git config --global core.pager "$pager"
}

# prints git diff excluding package-lock
function gdq() {
  git diff -- . ':(exclude)package-lock.json'
}