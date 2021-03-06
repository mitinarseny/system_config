####### sindresorhus/pure #######
autoload -U promptinit; promptinit
PURE_PROMPT_SYMBOL='λ'
zstyle :prompt:pure:git:stash show yes
prompt pure
# zstyle ':prompt:pure:prompt:success' color cyan

####### Aloxaf/fzf-tab#fzf-tab #######
command -v fzf > /dev/null || disable-fzf-tab
FZF_TAB_FLAGS=(
    --ansi # Enable ANSI color support, necessary for showing groups
    --expect='$continuous_trigger,$print_query' # For continuous completion
    --nth=2,3 --delimiter='\x00' # Don't search prefix
    # '--color=hl:$(( $#headers == 0 ? 108 : 255 ))'
    --layout=reverse --height='${FZF_TMUX_HEIGHT:=30%}' --min-height=12
    --tiebreak=begin -m --bind=tab:down,btab:up,change:top,ctrl-space:toggle --cycle
    '--query=$query' # $query will be expanded to query string at runtime.
    '--header-lines=$#headers' # $#headers will be expanded to lines of headers at runtime
    --print-query
)

zstyle ':fzf-tab:*' fzf_flags $FZF_TAB_FLAGS

zstyle ':fzf-tab:*' insert-space false

# no prefix to indicate color
zstyle ':fzf-tab:*:' prefix ''

# white color is there is no group
zstyle ':fzf-tab:*' default-color $'\033[37m'

# do not show groups if only one available
zstyle ':fzf-tab:*' single-group ''

####### zsh-users/zsh-autosuggest #######
# https://github.com/zsh-users/zsh-autosuggestions#enable-asynchronous-mode
ZSH_AUTOSUGGEST_USE_ASYNC=true
ZSH_AUTOSUGGEST_ACCEPT_WIDGETS="${ZSH_AUTOSUGGEST_ACCEPT_WIDGETS} \
  key-right \
  key-end \
  key-end2 \
"
ZSH_AUTOSUGGEST_PARTIAL_ACCEPT_WIDGETS="${ZSH_AUTOSUGGEST_PARTIAL_ACCEPT_WIDGETS} \
  key-cright \
  key-aright \
"

####### zdharma/fast-syntax-highlighting #######
# https://github.com/zdharma/fast-syntax-highlighting/issues/135#issuecomment-497452498
FAST_HIGHLIGHT[whatis_chroma_type]=0
FAST_HIGHLIGHT_STYLES[unknown-token]='fg=red'

####### zsh-users/zsh-history-substring-search #######
# bindkey "$terminfo[kcuu1]" history-substring-search-up
# bindkey "$terminfo[kcud1]" history-substring-search-down
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
typeset -g HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='fg=black,bg=cyan'
typeset -g HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='fg=white,bg=red'

