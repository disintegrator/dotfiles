ghcd() {
  local repo="$1"
  repo="${repo#https://github.com/}"
  repo="${repo#http://github.com/}"
  repo="${repo%.git}"

  local dir="$HOME/github.com/$repo"

  if [[ ! -d "$dir" ]]; then
    git clone "https://github.com/$repo.git" "$dir" || return 1
  fi

  cd "$dir"
}

vsc() {                      
  local cmd=($HOME/.vscode-server/cli/servers/*/server/bin/remote-cli/code(N[1]))
  if (( ${#cmd} == 0 )); then                                                                               
    echo "code not found in ~/.vscode-server" >&2
    return 1                                                                                                
  fi            
  "$cmd" --remote ssh-remote+orb "$@"
}
