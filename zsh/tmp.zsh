alias mv='mv -i'
alias cp='cp -i'
alias rm='rm -i'
alias ln='ln -i'
alias vim='nvim'
alias ls='ls --color=always --group-directories-first'
alias grep='grep --color=always'
alias vimrc='cd ~/.config/nvim/'
alias kittyrc='nvim .config/kitty/kitty.conf'
alias tmuxrc='nvim .config/tmux/tmux.conf'
alias tmux='tmux -u'
alias swap='cd ~/.local/state/nvim/swap'
alias image='sxiv'
alias pdf='zathura'
alias ..='cd ..'
alias sl='ls'
alias cal='cal | grep --color -EC6 "\b$(date +%e | sed "s/ //g")"'
alias l='ls -lha --color=always --group-directories-first'
alias ll='ls -lha --color=always --group-directories-first'
alias connectgreen='ssh white@192.168.1.233'
alias du='du -h'
alias startsql='sudo systemctl start mysql'
alias stopsql='sudo systemctl stop mysql'
alias statussql='systemctl status mysql'
alias se='grep -rIn'
alias fk='fg'
alias batcat='batcat --theme=base16'
alias zshrc='cd ~/.config/zsh'
function ex()
{
	if [ -f $1 ] ; then
	case $1 in
		*.tar.gz)  tar xzf $1   ;;
		*.rar)     unrar x $1   ;;
		*.gz)      gunzup $1    ;;
		*.tar)     tar xf $1    ;;
		*.zip)     unzip $1     ;;
		*.tar.xz)  tar xf $1    ;;
		*)   echo "'$1' cannot be extracted via ex()" ;;
		esac
	else
	echo "'$1' is no a valid file"
	fi
}
bindkey -v

export KEYTIMEOUT=1
bindkey -v '^?' backward-delete-char
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;      # block
        viins|main) echo -ne '\e[5 q';; # beam
    esac
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q'
preexec() { echo -ne '\e[5 q' ;}
. "$HOME/.cargo/env"
ZDOTDIR=~/.config/zsh

export HISTFILE=~/.config/zsh/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000
export PKG_CONFIG_PATH=/var/lib/flatpak/runtime/org.freedesktop.Sdk/x86_64/23.08/d987c17e2bd6d281203b8a5dc8654b95d0720a0794a0f8baea24f61d0abc79d8/files/lib/x86_64-linux-gnu/pkgconfig/

# export GOROOT=/usr/local/go
# export GOPROXY=https://proxy.golang.org

# colored man pages
export LESS_TERMCAP_mb=$'\e[1;36m'
export LESS_TERMCAP_md=$'\e[1;36m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;32m'


export FZF_DEFAULT_COMMAND='find ~/. \( -name .rustup -o -name .git -o -name .npm -o -name no_search -o -name .cargo -o -name yarn -o -name emacs -o -name .m2 -o -name BraveSoftware -o -name thorium -o -name .icons -o -name .cache -o -name .var -o -name .wine -o -name .themes -o -name .surf -o -name .local -o -name .mozilla -o -name walls -o -name wallpapers -o -name GIMP -o -name os-tutorial -o -name costimazation -o -name zsh-autosuggestions -o -name coc -o -name libreoffice -o -name zsh-syntax-highlighting -o -name .zoom -o -name workbench -o -name .virtualBox -o -name content_shell \) -prune -o -print'

autoload -U colors && colors

PROMPT='%B%F{magenta}%~%f%b%B%F{green} %b❯ %f'
# PROMPT='%B%F{magenta}%~%f%b%B%F{green} $ %f%b'

# setopt promptsubst
# PS1=$'%F{7}${(r:$COLUMNS::-:)}%f'$PS1

path+=~/archive/.scripts
path+=/usr/local/go/bin
path+=~/.cargo/env

setopt appendhistory
setopt autocd

# autoload -U compinit
# zstyle ':completion:*' menu select
# zmodload zsh/complist
# compinit
# _comp_options+=(globdots)	

#source ~/.config/zsh/alias.zsh
#source ~/.config/zsh/vi-mode.zsh
#source ~/.config/zsh/functions.zsh
#source	~/.config/zsh-autosuggestions/zsh-autosuggestions.zsh
#source ~/.config/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#source ~/.config/zsh/fsh/fast-syntax-highlighting.plugin.zsh
