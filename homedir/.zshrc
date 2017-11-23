# Path to your antigen configuration.
source /usr/local/share/antigen/antigen.zsh

#Path to powerlevel9k theme
POWERLEVEL9K_INSTALLATION_PATH=$ANTIGEN_BUNDLES/bhilburn/powerlevel9k

# Powerlevel9k Customization
#POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir rbenv vcs)
#POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status history time)
# colorcode test
# for code ({000..255}) print -P -- "$code: %F{$code}This is how your text would look like%f"
#POWERLEVEL9K_NVM_FOREGROUND='000'
#POWERLEVEL9K_NVM_BACKGROUND='072'
#POWERLEVEL9K_SHOW_CHANGESET=true

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
antigen bundle z
antigen bundle cp
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle command-not-found
antigen bundle compleat

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
# export DISABLE_AUTO_TITLE="true"

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
