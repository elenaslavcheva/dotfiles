# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/kamilhristov/.fzf/bin* ]]; then
  export PATH="$PATH:/Users/kamilhristov/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/kamilhristov/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/Users/kamilhristov/.fzf/shell/key-bindings.zsh"

