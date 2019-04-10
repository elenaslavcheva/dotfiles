# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/kamil.hristov/.fzf/bin* ]]; then
  export PATH="$PATH:/Users/kamil.hristov/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/kamil.hristov/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/Users/kamil.hristov/.fzf/shell/key-bindings.zsh"

