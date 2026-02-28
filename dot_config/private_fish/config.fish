set -gx EDITOR nvim
if [ "$TERM_PROGRAM" = "vscode" ]
  export EDITOR="code --wait"
end

if [ -d "$HOME/google-cloud-sdk/bin" ]
  set -gx PATH $HOME/google-cloud-sdk/bin $PATH
end

if set -q AQUA_ROOT_DIR
  set -gx PATH $AQUA_ROOT_DIR/bin $PATH
else if set -q XDG_DATA_HOME
  set -gx PATH $XDG_DATA_HOME/aquaproj-aqua/bin $PATH
else
  set -gx PATH $HOME/.local/share/aquaproj-aqua/bin $PATH
end

if set -q XDG_CONFIG_HOME
  set -gx AQUA_GLOBAL_CONFIG $XDG_CONFIG_HOME/aquaproj-aqua/aqua.yaml
else
  set -gx AQUA_GLOBAL_CONFIG $HOME/.config/aquaproj-aqua/aqua.yaml
end

set mise_bin $HOME/.local/bin/mise
if [ -s "$mise_bin" ]
  $mise_bin activate fish | source
end

if command -v go > /dev/null
  if [ -d "$go_bin" ]
    set -gx PATH (go env GOPATH)/bin $PATH
  end
end

export DENO_INSTALL="$HOME/.deno"
if [ -d "$DENO_INSTALL/bin" ]
  set -gx PATH $DENO_INSTALL/bin $PATH
end

export BUN_INSTALL="$HOME/.bun"
if [ -d "$BUN_INSTALL/bin" ]
  set -gx PATH $BUN_INSTALL/bin $PATH
end

set swift_bin $HOME/.swift/usr/bin
if [ -d "$swift_bin" ]
  set -gx PATH $swift_bin $PATH
end

if status is-interactive
  # Commands to run in interactive sessions can go here
  if command -v zoxide > /dev/null
    zoxide init fish | source
  end

  source $HOME/.aliases.sh
  source $HOME/.secrets.sh

  starship init fish | source
  regolith init fish | source
  atuin init fish | source
end


# pnpm
set -gx PNPM_HOME "/home/disintegrator/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
