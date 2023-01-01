cite 'about-alias'
about-alias 'RLovelessIII aliases'

# Aliases

## Commands

### ls
alias ls='ls --group-directories-first --color=auto'
alias la='ls -a --group-directories-first --color=auto'
alias ll='ls -l --group-directories-first --color=auto'

### grep
alias grep='grep --color=auto'

### nvim
alias v='nvim'
alias sv='sudo v'
alias vi='v'
alias vim='v'

### dnf
alias dnf='sudo dnf'
alias dnr='dnf remove -y'
alias dns='dnf search'
alias dni='dnf install -y'
alias dnu='dnf update -y'
alias dngi='dnf groupinstall'

### snap
alias snap='sudo snap'
alias sni='snap install'
alias snic='snap install $@ --classic'
alias snr='snap remove'

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
alias gcp='git clone'
alias gf='git fetch'
alias gi='git init'
alias gp='git pull'
alias gw='git commit -m'
alias gpu='git push'
alias gpo='git push origin'
alias gco='git checkout'
alias gs='git status'

### systemctl
alias systemctl='sudo systemctl'
alias scs='systemctl start'
alias scstp='systemctl stop'
alias scena='systemctl enable'
alias scdis='systemctl disable'

## Shortcuts
alias vba='nvim ~/.bash_it/custom/rlovelessiii.aliases.bash'
alias vbt='nvim ~/.bash_it/themes/rlovelessiii/rlovelessiii.theme.bash'

