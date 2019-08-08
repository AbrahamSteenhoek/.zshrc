# Set up the prompt

setopt histignorealldups sharehistory

# Use vi keybindings
bindkey -v

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit
autoload -U colors && colors

CASE_SENSITIVE="false"
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'


# set the PROMPT variables
autoload -U zsh/terminfo
if [[ "$terminfo[colors]" -ge 8 ]]; then
	colors
	# echo 'colors!'
	# set the prompt with color
	#PS1='[%n@%m:%c]%# '
    right_arrow=\u2192
    arrow=\u21A0
    PS1=$'%B%F{green}%n@%F{green}%m%F{gray} > %b'
	#PS1='%(!.%{$fg_bold[red]%}.%{$fg_bold[green]%}%n@)%m %{$fg_bold[blue]%}%(!.%1~.%~) $(git_prompt_info)$(prompt_char)%{$reset_color%} '
	RPS1='%B%F{blue}%~'
	# PS2="%8%{${fg[green]}%}%n@%n%{$fg[white]}%}> "
	# echo 'done with colors!'
fi

# aliases for convenience
alias ll="ls -l"
alias cdp="cd ~/projects"
alias c="clear"
alias buildmcp="cd ~/projects/mcp/Mcp/Application/builds/host-debug;ninja;cd -"
alias sqide.py=squide.py
# alias armstrip='/opt/nxt/sdk/latest/nitrogen6x/sysroots/x86_64-agleader-linux/usr/bin/arm-agleader-linux-gnueabi/arm-agleader-linux-gnueabi-strip'
alias arm-strip='/opt/nxt/sdk/latest/nxt/sysroots/x86_64-agleader-linux/usr/bin/arm-agleader-linux-gnueabi/arm-agleader-linux-gnueabi-strip'
alias gitg='git log --graph --oneline --decorate --all'
bindkey -v
bindkey '^R' history-incremental-search-backward

export VISUAL=vim
export EDITOR="$VISUAL":

source ~/.myenv
. /home/ajsteenhoek/z.sh
