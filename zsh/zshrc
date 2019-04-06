#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

export XDG_CONFIG_HOME="$HOME/.config"
export MEDIA="/home/xmiah/Medi"
export PICTURE="$HOME/Imagens"
export WALLPAPER="$PICTURE/Wallpapers"
export DOTS="/home/xmiah/Desktop/dots"
export TwoBWM="$XDG_CONFIG_HOME/2bwm"
export DOWNLOADS="$HOME/Downloads"

# Customize to your needs...

zle -N zle-line-init
zle -N zle-keymap-select
zstyle ':completion:*' rehash true
setopt COMPLETE_ALIASES
setopt multios
setopt zle

# show completion menu on successive tab press
setopt auto_menu
# do not autoselect the first completion entry
unsetopt menu_complete

# History
# Allow multiple terminal sessions to all append to one zsh command history
setopt append_history
# Save timestamp of command and duration
setopt extended_history
# Add commands as they are typed, don't wait until shell exit
setopt inc_append_history
# Imports new commands and appends typed commands to history
setopt share_history
setopt hist_no_store

## VI-MODES
export KEYTIMEOUT=1

# bind k and j for VI mode
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# Don't store failed command to history
zshaddhistory() { whence ${${(z)1}[1]} >| /dev/null || return 1 }

# only completion hostname in ~/.ssh/config
zstyle -e ':completion:*:hosts' hosts 'reply=(${=${${${${(@M)${(f)"$(cat ~/.ssh/config 2>/dev/null)"}:#Host *}#Host }:#*\**}:#*\?*}})'

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

LANG=en_US.UTF-8
LANGUAGE=en_US.UTF-8

export TERM='xterm-256color'
export TERM='rxvt-unicode-256color'
export TERM='st-256color'

export LS_COLORS='no=00:rs=0:fi=00:di=01;34:ln=36:mh=04;36:pi=04;01;36:so=04;33:do=04;01;36:bd=01;33:cd=33:or=31:mi=01;37;41:ex=01;36:su=01;04;37:sg=01;04;37:ca=01;37:tw=01;37;44:ow=01;04;34:st=04;37;44:*.7z=01;32:*.ace=01;32:*.alz=01;32:*.arc=01;32:*.arj=01;32:*.bz=01;32:*.bz2=01;32:*.cab=01;32:*.cpio=01;32:*.deb=01;32:*.dz=01;32:*.ear=01;32:*.gz=01;32:*.jar=01;32:*.lha=01;32:*.lrz=01;32:*.lz=01;32:*.lz4=01;32:*.lzh=01;32:*.lzma=01;32:*.lzo=01;32:*.rar=01;32:*.rpm=01;32:*.rz=01;32:*.sar=01;32:*.t7z=01;32:*.tar=01;32:*.taz=01;32:*.tbz=01;32:*.tbz2=01;32:*.tgz=01;32:*.tlz=01;32:*.txz=01;32:*.tz=01;32:*.tzo=01;32:*.tzst=01;32:*.war=01;32:*.xz=01;32:*.z=01;32:*.Z=01;32:*.zip=01;32:*.zoo=01;32:*.zst=01;32:*.aac=32:*.au=32:*.flac=32:*.m4a=32:*.mid=32:*.midi=32:*.mka=32:*.mp3=32:*.mpa=32:*.mpeg=32:*.mpg=32:*.ogg=32:*.opus=32:*.ra=32:*.wav=32:*.3des=01;35:*.aes=01;35:*.gpg=01;35:*.pgp=01;35:*.doc=32:*.docx=32:*.dot=32:*.odg=32:*.odp=32:*.ods=32:*.odt=32:*.otg=32:*.otp=32:*.ots=32:*.ott=32:*.pdf=32:*.ppt=32:*.pptx=32:*.xls=32:*.xlsx=32:*.app=01;36:*.bat=01;36:*.btm=01;36:*.cmd=01;36:*.com=01;36:*.exe=01;36:*.reg=01;36:*~=02;37:*.bak=02;37:*.BAK=02;37:*.log=02;37:*.log=02;37:*.old=02;37:*.OLD=02;37:*.orig=02;37:*.ORIG=02;37:*.swo=02;37:*.swp=02;37:*.bmp=32:*.cgm=32:*.dl=32:*.dvi=32:*.emf=32:*.eps=32:*.gif=32:*.jpeg=32:*.jpg=32:*.JPG=32:*.mng=32:*.pbm=32:*.pcx=32:*.pgm=32:*.png=32:*.PNG=32:*.ppm=32:*.pps=32:*.ppsx=32:*.ps=32:*.svg=32:*.svgz=32:*.tga=32:*.tif=32:*.tiff=32:*.xbm=32:*.xcf=32:*.xpm=32:*.xwd=32:*.xwd=32:*.yuv=32:*.anx=32:*.asf=32:*.avi=32:*.axv=32:*.flc=32:*.fli=32:*.flv=32:*.gl=32:*.m2v=32:*.m4v=32:*.mkv=32:*.mov=32:*.MOV=32:*.mp4=32:*.mpeg=32:*.mpg=32:*.nuv=32:*.ogm=32:*.ogv=32:*.ogx=32:*.qt=32:*.rm=32:*.rmvb=32:*.swf=32:*.vob=32:*.webm=32:*.wmv=32:'
#
# Time
#
function datetime() {
	date +'%Y-%m-%d %H:%M:%S.%3N'
}

#
# Auto cd tmpfs
#
export FSTART="/home/xmiah/どうした？"

if [[ $PWD == $HOME ]]; then
	cd $FSTART
fi

export VISUAL='nvim'
export EDITOR="${VISUAL}"
export RANGER_LOAD_DEFAULT_RC=FALSE
export BROWSER='firefox'

# alias command
alias emerge='sudo emerge'
alias layman='sudo layman'
alias mkdir='mkdir -p -v'
alias mpv='mpv --loop=8'
alias rm='rm -I -f'
alias cp='cp -f -p'
alias grep='grep --color=auto'
alias du='du -c -h'
alias sxiv='sxiv -b'
alias ranger='env TERM=xterm-256color ranger'
alias dmesg='dmesg -HL'
alias ping='ping -c 3'
alias tree='tree -CAFa -I "CVS|*.*.package|.svn|.git|.hg|node_modules|bower_components" --dirsfirst'
alias ps_mem='sudo ps_mem'
alias less='less -r'
alias neofetch='neofetch --ascii $HOME/bin/cat-cat'
alias tmux='env TERM="screen-256color" tmux'

alias ls='ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" -lrS --color=auto -F'
alias la='ls -lha --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'

alias :q='exit'
alias rsync='rsync -avzhe --process'
alias glances='glances -2 --disable-bg --process-short-name'

# scripts download aria2 url
alias dl='~/Desktop/aria2rpc/aria2rpc.py -s aria2rpc-firefox'
alias undervolt='sudo ~/.local/lib64/python2.7/site-packages/undervolt.py'

# alias poweroff
alias poweroff='sudo poweroff'
alias reboot='sudo reboot'
alias suspend='sudo pm-suspend'
