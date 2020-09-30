cite 'about-alias'
about-alias 'My aliases'

# Aliases
if [[ $(uname) == "Linux" ]]; then
  alias ls='ls --group-directories-first --color=auto'
  alias grep='grep --color=auto'
fi

if [[ $(hostname) == "knight" ]]; then
    alias display-setup='${HOME}/.scripts/display.sh'
fi

alias update-theme='${HOME}/.scripts/themeGen/launch.sh'
alias vim=nvim
