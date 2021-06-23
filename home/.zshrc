################################################################################
#
# ZSH configuration entrypoint
#
################################################################################

export DOTFILES="${HOME}/.config/dotfiles"

fpath=("${DOTFILES}/compdef" "${fpath[@]}")

autoload -Uz compinit && compinit -i

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

# Settings : History
############################################################

setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_VERIFY
setopt INC_APPEND_HISTORY

# Settings :: Completion
############################################################

zstyle ':completion:*' expand prefix suffix
zstyle ':completion:*' insert-tab pending
zstyle ':completion:*' list-suffixes
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' menu select=2
zstyle ':completion::complete:*' gain-privileges 1

# Pure prompt :: Apple silicon workaround
# See: https://github.com/sindresorhus/pure/issues/584
############################################################

fpath+=$DOTFILES/zsh/prompt/pure

autoload -U promptinit; promptinit
prompt pure

# Color
############################################################

source "${DOTFILES}/zsh/snazzy.lscolors"
