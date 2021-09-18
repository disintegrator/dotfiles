load_secrets() {
	# shellcheck disable=SC1091
	[ -s "$HOME/.secrets.sh" ] && . "$HOME/.secrets.sh"
}
load_aliases() {
	# shellcheck disable=SC1091
	[ -s "$HOME/.aliases.sh" ] && . "$HOME/.aliases.sh"
}

export EDITOR=nvim
export PYTHON_ENV=development
export HOMEBREW_NO_INSECURE_REDIRECT=1
export HOMEBREW_CASK_OPTS=--require-sha
export HOMEBREW_NO_ANALYTICS=1
export NVM_DIR="$HOME/.nvm"
export PYENV_ROOT="$HOME/.pyenv"
export GOPATH="$HOME/go"
export FZF_DEFAULT_OPTS="--bind ctrl-a:select-all"
export BAT_THEME=Dracula

export PATH="$HOME/go/bin:$PYENV_ROOT/bin:$PATH"

[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"
[ -f "$HOME/.config/broot/launcher/bash/br" ] && . "$HOME/.config/broot/launcher/bash/br"
[ -f ~/.fzf.zsh ] && . "$HOME/.fzf.zsh"

eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(rbenv init -)"
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

load_aliases
load_secrets
