
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000 bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/evan/.zshrc'

autoload -Uz compinit
compinit

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
function greet_user() {
  # ANSI escape codes for blue and reset
  local BLUE="\033[34m"
  local RESET="\033[0m"

  # Set your name here
  local name="${BLUE}evan${RESET}"

  # Get current hour (24-hour format)
  local hour=$(date +"%H")
  local time="${BLUE}$(date +"%I:%M %p")${RESET}"
  local day="${BLUE}$(date +"%A")${RESET}"

  # Determine greeting based on time
  local greeting=""
  if (( hour < 12 )); then
    greeting="morning"
  elif (( hour < 18 )); then
    greeting="afternoon"
  else
    greeting="evening"
  fi

  echo "Good $greeting, $name\n    It's $time on a magnificent $day!"
}

fastfetch --color '#b3bbfa'
greet_user

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source ~/powerlevel10k/powerlevel10k.zsh-theme

# I hate plugin managers, so I use this; a 20 line plugin *installer*, and since its only 20 lines = peak perf

##? Clone a plugin, identify its init file, source it, and add it to your fpath.
function plugin-load {
  local repo plugdir initfile initfiles=()
  : ${ZPLUGINDIR:=${ZDOTDIR:-~/.config/zsh}/plugins}
  for repo in $@; do
    plugdir=$ZPLUGINDIR/${repo:t}
    initfile=$plugdir/${repo:t}.plugin.zsh
    if [[ ! -d $plugdir ]]; then
      echo "Cloning $repo..."
      git clone -q --depth 1 --recursive --shallow-submodules \
        https://github.com/$repo $plugdir
    fi
    if [[ ! -e $initfile ]]; then
      initfiles=($plugdir/*.{plugin.zsh,zsh-theme,zsh,sh}(N))
      (( $#initfiles )) || { echo >&2 "No init file '$repo'." && continue }
      ln -sf $initfiles[1] $initfile
    fi
    fpath+=$plugdir
    (( $+functions[zsh-defer] )) && zsh-defer . $initfile || . $initfile
  done
}

# zsh defer = turbo speeds!
plugin-load romkatv/zsh-defer # improves speed of plugins massively

plugin-load zsh-users/zsh-syntax-highlighting
plugin-load zsh-users/zsh-autosuggestions
plugin-load zsh-users/zsh-completions
plugin-load Junker/zsh-archlinux
plugin-load jocelynmallon/zshmarks

# zoxide
eval "$(zoxide init zsh)"

# aliases

# zsh marks
alias g="jump"
alias s="bookmark"
alias d="deletemark"
alias p="showmarks"
alias l="showmarks"

alias fastfetch="fastfetch --color '#b3bbfa'"
# this is just funny
alias whoareyou="echo linux, arch linux"
# undertale
alias undertale="env WINEPREFIX=\"/home/evan/.wine\" wine \"/home/evan/.wine/drive_c/GOG Games/Undertale/UNDERTALE.exe\""
alias cbonzai="cbonsai"
# vim = nvim
alias vim="nvim"

# path exports

# spicetify
export PATH=$PATH:/home/evan/.spicetify
# undertale
export PATH="/home/evan/.wine/drive_c/GOG Games/Undertale/Undertale.exe:$PATH"
# ruby
export PATH="/home/evan/.local/share/gem/ruby/3.4.0/bin:$PATH"
# python
export PATH="/home/evan/myenv/bin/python3:$PATH"
# yazi
export EDITOR="nvim"
# debuggers
export PATH="$PATH:/home/evan/Documents/programming_tools/codelldb/extension/adapter"
# asdf language manager
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"


. "/home/evan/.deno/env"

# Created by `pipx` on 2025-05-24 20:06:41
export PATH="$PATH:/home/evan/.local/bin"
