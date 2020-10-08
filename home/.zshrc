################################################################################
#
# ZSH configuration entrypoint
#
################################################################################

export DOTFILES="${HOME}/.config/dotfiles"

fpath=("${DOTFILES}/compdef" "${fpath[@]}")

autoload -Uz compinit && compinit -i
#autoload -Uz projects

# Imports
############################################################

source "${DOTFILES}/zsh/.paths"
source "${DOTFILES}/zsh/.exports"
source "${DOTFILES}/zsh/.plugins"
source "${DOTFILES}/zsh/.aliases"
source "${DOTFILES}/zsh/.functions"

# Settings :: General
############################################################

setopt CORRECT
setopt NO_BEEP
setopt AUTO_CD
setopt AUTO_MENU
setopt AUTO_PUSHD

# Settings :: Completion
############################################################

zstyle ':completion:*' expand prefix suffix
zstyle ':completion:*' insert-tab pending
zstyle ':completion:*' list-suffixes
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' menu select=2
zstyle ':completion::complete:*' gain-privileges 1

# Color
############################################################

source "${DOTFILES}/zsh/snazzy.lscolors"
