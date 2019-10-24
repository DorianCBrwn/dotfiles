# Path to your antigen configuration.
source $(brew --prefix)/share/antigen/antigen.zsh

POWERLEVEL9K_INSTALLATION_PATH=$ANTIGEN_BUNDLES/bhilburn/powerlevel9k
ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_MODE="nerdfont-complete"
#Wifi Status Script
zsh_internet_signal(){
  #source on quality levels - http://www.wireless-nets.com/resources/tutorials/define_SNR_values.html
  #source on signal levels  - http://www.speedguide.net/faq/how-to-read-rssisignal-and-snrnoise-ratings-440
	local signal=$(airport -I | grep agrCtlRSSI | awk '{print $2}' | sed 's/-//g')
  local noise=$(airport -I | grep agrCtlNoise | awk '{print $2}' | sed 's/-//g')
  local SNR=$(bc <<<"scale=2; $signal / $noise")

  local net=$(curl -D- -o /dev/null -s http://www.google.com | grep HTTP/1.1 | awk '{print $2}')
  local color='%F{yellow}'
  local symbol="\uf197"

  # Excellent Signal (5 bars)
  if [[ ! -z "${signal// }" ]] && [[ $SNR -gt .40 ]] ;
    then color='%F{blue}' ; symbol="\uf1eb" ;
  fi

  # Good Signal (3-4 bars)
  if [[ ! -z "${signal// }" ]] && [[ ! $SNR -gt .40 ]] && [[ $SNR -gt .25 ]] ;
    then color='%F{green}' ; symbol="\uf1eb" ;
  fi

  # Low Signal (2 bars)
  if [[ ! -z "${signal// }" ]] && [[ ! $SNR -gt .25 ]] && [[ $SNR -gt .15 ]] ;
    then color='%F{yellow}' ; symbol="\uf1eb" ;
  fi

  # Very Low Signal (1 bar)
  if [[ ! -z "${signal// }" ]] && [[ ! $SNR -gt .15 ]] && [[ $SNR -gt .10 ]] ;
    then color='%F{red}' ; symbol="\uf1eb" ;
  fi

  # No Signal - No Internet
  if [[ ! -z "${signal// }" ]] && [[ ! $SNR -gt .10 ]] ;
    then color='%F{red}' ; symbol="\uf011";
  fi

  if [[ -z "${signal// }" ]] && [[ "$net" -ne 200 ]] ;
    then color='%F{red}' ; symbol="\uf011" ;
  fi

  # Ethernet Connection (no wifi, hardline)
  if [[ -z "${signal// }" ]] && [[ "$net" -eq 200 ]] ;
    then color='%F{blue}' ; symbol="\uf197" ;
  fi

  echo -n "%{$color%}$symbol " # \f1eb is wifi bars
}
POWERLEVEL9K_CUSTOM_INTERNET_SIGNAL="zsh_internet_signal"
#Prompt Elements
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon context dir rbenv vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status custom_internet_signal background_jobs history battery time)
#Element Customization
POWERLEVEL9K_OS_ICON_FOREGROUND="044"
POWERLEVEL9K_CONTEXT_TEMPLATE=$'\ue795'
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='201'
POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND='017'
POWERLEVEL9K_DIR_HOME_FOREGROUND='044'
POWERLEVEL9K_DIR_HOME_BACKGROUND='025'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='044'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='025'
POWERLEVEL9K_DIR_ETC_FOREGROUND='044'
POWERLEVEL9K_DIR_ETC_BACKGROUND='025'
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='044'
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='025'
POWERLEVEL9K_STATUS_OK_BACKGROUND='017'
POWERLEVEL9K_HISTORY_BACKGROUND='054'
POWERLEVEL9K_HISTORY_FOREGROUND='044'
POWERLEVEL9K_BATTERY_CHARGING='yellow'
POWERLEVEL9K_BATTERY_CHARGED='green'
POWERLEVEL9K_BATTERY_DISCONNECTED='044'
POWERLEVEL9K_BATTERY_LOW_THRESHOLD='10'
POWERLEVEL9K_BATTERY_LOW_COLOR='red'
POWERLEVEL9K_BATTERY_ICON='\uf1e6'
POWERLEVEL9K_TIME_BACKGROUND='200'
POWERLEVEL9K_TIME_FOREGROUND='255'
POWERLEVEL9K_TIME_FORMAT='%D{%H:%M}'

#BulletTrain
#BULLETTRAIN_PROMPT_ORDER=(
#  git
#  context
#  dir
#  time
#)

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

#Themes
#antigen theme https://github.com/caiogondim/bullet-train-oh-my-zsh-theme bullet-train
antigen theme bhilburn/powerlevel9k powerlevel9k

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
export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim
