export PATH="/opt/homebrew/opt/bash/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export PATH="/opt/homebrew/opt/node@20/bin:$PATH"

export EDITOR='nvim'

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

# vim line editing
set -o vi
bindkey -M viins '^?' backward-delete-char

eval "$(starship init zsh)"

## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /Users/johnrobinson/.dart-cli-completion/zsh-config.zsh ]] && . /Users/johnrobinson/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]

