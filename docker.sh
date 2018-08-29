alias dc='docker-compose'
alias docker-clean='docker system prune -a'
alias docker-clean-containers='docker ps -a -q | xargs docker stop && docker ps -a -q | xargs docker rm'

# Install inside docker
function di() {
  docker-compose run --entrypoint sh "$(jq '.name' package.json | sed 's/"//g')" -c 'npm install'
}

# Print fromatted docker status 
function dps() {
  if [ "$1" == "-p" ]; then
    docker ps --format 'table {{.Names}}\t{{.Status}}\t{{.Ports}}'
  else
    docker ps --format 'table {{.Names}}\t{{.Status}}'
  fi
}