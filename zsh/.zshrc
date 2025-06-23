# Hello! My zsh config is heavily based on the zsh-bench diy++, with my own plugins;
# I didnt use zsh4humans because I want it to be simple (this entire config excluding comments is <50 lines) and I want to know
# exactly what my code is doing. 
# The stats (with bloat in background and on mid pc):
#creates_tty=0
#has_compsys=1
#has_syntax_highlighting=1
#has_autosuggestions=1
#has_git_prompt=0
#first_prompt_lag_ms=42.797
#first_command_lag_ms=134.465
#command_lag_ms=17.807
#input_lag_ms=11.016
#exit_time_ms=74.209



function zcompile-many() {
  local f
  for f; do zcompile -R -- "$f".zwc "$f"; done
}

# Clone and compile to wordcode missing plugins.

# faster syntax highlighting
if [[ ! -e ~/.config/zsh/plugins/fast-syntax-highlighting ]]; then
  git clone --depth=1 https://github.com/zdharma-continuum/fast-syntax-highlighting.git ~/.config/zsh/plugins/fast-syntax-highlighting
  zcompile-many ~/.config/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
fi

# zsh autosuggestions like fish shell
if [[ ! -e ~/.config/zsh/plugins/zsh-autosuggestions ]]; then
  git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions.git ~/.config/zsh/plugins/zsh-autosuggestions
  zcompile-many ~/.config/zsh/plugins/zsh-autosuggestions/{zsh-autosuggestions.zsh,src/**/*.zsh}
fi

# p10k instant prompt, good for perf
if [[ ! -e ~/.config/zsh/plugins/powerlevel10k ]]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.config/zsh/plugins/powerlevel10k
  make -C ~/.config/zsh/plugins/powerlevel10k pkg
fi

# extra zsh completions
if [[ ! -e ~/.config/zsh/plugins/zsh-completions ]]; then
  git clone --depth=1 https://github.com/zsh-users/zsh-completions.git ~/.config/zsh/plugins/zsh-completions
  zcompile-many ~/.config/zsh/plugins/zsh-completions/zsh-completions.plugin.zsh
fi

# fzf tab
if [[ ! -e ~/.config/zsh/plugins/fzf-tab ]]; then
  git clone --depth=1 https://github.com/Aloxaf/fzf-tab.git ~/.config/zsh/plugins/fzf-tab
  zcompile-many ~/.config/zsh/plugins/fzf-tab/fzf-tab.plugin.zsh
fi

# greeting, my custom plugin I generated with AI lol
if [[ ! -e ~/.config/zsh/plugins/greeting ]]; then
  git clone --depth=1 git@github.com:prakharevan1/zsh-greeting.git ~/.config/zsh/plugins/greeting # private so it needs a ssh, maybe later ill public it lol
  zcompile-many ~/.config/zsh/plugins/greeting/greeting.zsh
fi

source ~/.config/zsh/plugins/greeting/greeting.zsh # I need to load it before p10k as it does print output

# Activate Powerlevel10k Instant Prompt.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Enable the "new" completion system (compsys).

# fzf tab customization
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'colorls -1 --color=always $realpath'
# tmux for fzf tab
zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup
zstyle ':fzf-tab:*' fzf-flags --style minimal

# compinit + recompile the z comp dump into wordcode
autoload -Uz compinit && compinit
[[ ~/.zcompdump.zwc -nt ~/.zcompdump ]] || zcompile-many ~/.zcompdump
unfunction zcompile-many

ZSH_AUTOSUGGEST_MANUAL_REBIND=1

# Load plugins.
source ~/.config/zsh/plugins/fzf-tab/fzf-tab.plugin.zsh
source ~/.config/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh/plugins/zsh-completions/zsh-completions.plugin.zsh
source ~/.config/zsh/plugins/powerlevel10k/powerlevel10k.zsh-theme
source ~/.p10k.zsh

# alias's

alias fastfetch="fastfetch --color '#b3bbfa'"
# this is just funny
alias whoareyou="echo linux, arch linux"
# undertale
alias undertale="env WINEPREFIX=\"/home/evan/.wine\" wine \"/home/evan/.wine/drive_c/GOG Games/Undertale/UNDERTALE.exe\""
alias cbonzai="cbonsai"
# vim = nvim
alias vim="nvim"
# jjk = jj
alias jjk=jj
# trash-cli
alias rm=trash-put
# color ls
alias ls=lsd
# following in the steps of ubuntu + its memory safe,
alias sudo=sudo-rs
alias su=su-rs
# fzf
alias fzf=fzf --style minimal
# zoxide
alias cd=z

# path exports

# spicetify
export PATH=$PATH:/home/evan/.spicetify
# ruby
export PATH="/home/evan/.local/share/gem/ruby/3.4.0/bin:$PATH"
# python
export PATH="/home/evan/myenv/bin/python3:$PATH"
# yazi
export EDITOR="nvim"
# debuggers
export PATH="$PATH:/home/evan/Documents/programming_tools/codelldb/extension/adapter"
# luarocks
export PATH="$PATH:/home/evan/.local/share/mise/installs/lua/5.1/luarocks/bin/luarocks"
# I use arch btw
export PATH="$PATH:/home/evan/Documents/programming_tools/i-use-arch-btw/build/cmd/i-use-arch-btw"
export PATH="$PATH:/home/evan/Documents/programming_tools/i-use-arch-btw/build/cmd/i-use-arch-btw-0.1"
# my custom update script
export PATH="$PATH:/home/evan/.config/zsh/"
# I need bluej for my ap csa course (bruh)
export PATH="$PATH:/home/evan/Documents/programming_tools/bluej"
# Created by `pipx` on 2025-05-24 20:06:41
export PATH="$PATH:/home/evan/.local/bin"

# zoxide
eval "$(zoxide init zsh)"
# mise
eval "$(~/.local/bin/mise activate zsh)"

# HISTORY
HISTSIZE=2000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
# erase all duplicates
HISTDUP=erase
setopt appendhistory # append rather than overwrite
setopt sharehistory # share history across panes
setopt hist_ignore_space # use space to prevent sensitive info from being shared
# we dont want duplicates in the file
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
