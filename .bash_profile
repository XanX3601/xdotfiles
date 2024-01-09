# aliases
alias ls="lsd"
alias ll="ls -al"

alias venv=". ./venv/bin/activate"

# starship
export STARSHIP_CONFIG=~/.config/starship/starship.toml
eval "$(starship init bash --print-full-init)"
