
##############################################################################
# History Configuration
##############################################################################
HISTSIZE=5000               #How many lines of history to keep in memory
HISTFILE=~/.zsh_history     #Where to save history to disk
SAVEHIST=5000               #Number of history entries to save to disk
#HISTDUP=erase               #Erase duplicates in the history file
setopt    appendhistory     #Append history to the history file (no overwriting)
setopt    sharehistory      #Share history across terminals
setopt    incappendhistory  #Immediately append to the history file, not just when a term is killed

bindkey '^R' history-incremental-search-backward

bindkey "^[[A" history-search-backward

bindkey "^[[B" history-search-forward

#cmd line powerline conf

function powerline_precmd() {
    PS1="$(~/powerline-shell.py $? --mode compatible --shell zsh 2> /dev/null)"
}

function install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}

if [ "$TERM" != "linux" ]; then
    install_powerline_precmd
fi


#export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

#source /usr/share/nvm/nvm.sh
#source /usr/share/nvm/install-nvm-exec

# place this after nvm initialization!
#autoload -U add-zsh-hook
#load-nvmrc() {
#  if [[ -f .nvmrc && -r .nvmrc ]]; then
#    nvm use
#  elif [[ $(nvm version) != $(nvm version default)  ]]; then
#    echo "Reverting to nvm default version"
#    nvm use default
#  fi
#}
#add-zsh-hook chpwd load-nvmrc
#load-nvmrc

