# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/evan/.zshrc'

autoload -Uz compinit
compinit

# greet user function
greet_user() {
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

# plugins
# zsh autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# zsh syntax highlighting
source /home/evan/Downloads/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# starship prompt
eval "$(starship init zsh)"
# zoxide
eval "$(zoxide init zsh)"

# my path exports

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

# my alias's
alias fastfetch="fastfetch --color '#b3bbfa'"
# this is just funny
alias whoareyou="echo linux, arch linux"
# undertale
alias undertale="env WINEPREFIX=\"/home/evan/.wine\" wine \"/home/evan/.wine/drive_c/GOG Games/Undertale/UNDERTALE.exe\""
alias cbonzai="cbonsai"

# bootup
sleep .1 # my terminal is literally too fast
fastfetch
greet_user
