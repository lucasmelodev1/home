eval "$(starship init zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$PATH:$(go env GOPATH)/bin"
export PATH="$PATH:$HOME/.cargo/bin"

# Pi
export PATH="$HOME/.local/bin:$PATH"

# bun completions
[ -s "/home/lucas/.bun/_bun" ] && source "/home/lucas/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
