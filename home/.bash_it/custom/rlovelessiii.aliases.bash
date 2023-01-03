cite 'about-alias'
about-alias 'RLovelessIII aliases'

# Aliases

## Commands

### ls
alias ls='ls --color=auto'
alias la='ls -a --color=auto'
alias ll='ls -l --color=auto'

### grep
alias grep='grep --color=auto'

### nvim
alias v='nvim'
alias sv='sudo v'
alias vi='v'
alias vim='v'

### docker
alias dcl='docker container list'
alias dcp='docker container prune'
alias dip='docker image prune'
alias dipa='dip -a'
alias dcs='docker container stop'
alias dbuild='docker build ./ -t'
alias drun='docker run -it'

### docker-compose
alias dcu='docker-compose up --force-recreate'
alias dcr='docker-compose run'

### git
alias ga='git add'
alias gcl='git clone'
alias gf='git fetch'
alias gi='git init'
alias gp='git pull'
alias gw='git commit -m'
alias gpu='git push origin'
alias gco='git checkout'
alias gs='git status'

## Shortcuts
alias vba='nvim ~/.bash_it/custom/rlovelessiii.aliases.bash'
alias vbt='nvim ~/.bash_it/themes/rlovelessiii/rlovelessiii.theme.bash'

