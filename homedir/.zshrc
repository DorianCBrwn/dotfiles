# Path to your antigen configuration.
source $(brew --prefix)/share/antigen/antigen.zsh

#BulletTrain
BULLETTRAIN_PROMPT_ORDER=(
  git
  context
  dir
  time
)

#Antigen Plugins
antigen use oh-my-zsh
antigen bundle git
antigen bundle directories
antigen bundle z
antigen bundle cp
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle command-not-found
antigen bundle compleat
antigen bundle common-aliases
antigen bundle rbenv
antigen bundle ruby


antigen bundle autojump # Enables autojump if installed with homebrew
if [ "$OSTYPE"="darwin11.0" ]; then
  antigen bundle osx
fi

antigen theme https://github.com/caiogondim/bullet-train-oh-my-zsh-theme bullet-train

antigen apply

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# disable colors in ls
# export DISABLE_LS_COLORS="true"

# disable autosetting terminal title.
 export DISABLE_AUTO_TITLE="true"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

source /usr/local/opt/nvm/nvm.sh

autoload -U add-zsh-hook
load-nvmrc() {
  if [[ -f .nvmrc && -r .nvmrc ]]; then
    nvm use &> /dev/null
  elif [[ $(nvm version) != $(nvm version default)  ]]; then
    nvm use default &> /dev/null
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# load fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Customize to your needs...
unsetopt correct
