# .bashrc

# User specific aliases and functions

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

echo
echo "> Loading user .bashrc..."
echo

PS1="\n[\t \D{%d/%m/%Y}] \[\033[92m\]\u@\H:\[\033[94m\]\w\[\033[39m\] \n"

echo
echo "> scripts/add2path.sh /home/fabian/soft/AgataSoftware /lib /bin... "
source /home/fabian/soft/AgataSoftware/scripts/add2path.sh /home/fabian/soft/AgataSoftware /lib /bin

echo
echo "> sourcing ROOT 6.10.06 debug..."
source /home/fabian/soft/root/root-6.10.06-install-debug/bin/thisroot.sh
alias root='root -l'

echo "> setting 'xmind' alias..."
alias xmind='cd /home/fabian/soft/xmind-8-update5-linux/XMind_amd64/ && ./XMind'

echo "> defining 'c_ganpro' function..."
c_ganpro()
{
	cd /home/fabian/soft/AgataSoftware
	python scripts/AgataSoftware.py --ganpro= conf
	python scripts/AgataSoftware.py --ganpro= install
}
#alias c_ganpro='python scripts/AgataSoftware.py --ganpro= clean && python scripts/AgataSoftware.py --ganpro= conf && python scripts/AgataSoftware.py --ganpro= install'

echo "> defining 'e_ganpro' function..."
e_ganpro()
{
	cd /home/fabian/soft/AgataSoftware/GANIL/ganpro/zTest/dev
	root Load_lib.C
}

echo "> functions 'show_color_base' and 'show_color_extended' defined"

echo "> defining 'meld' alias..."
alias meld='/home/fabian/soft/meld-3.18.0/bin/meld'

echo "> setting GRU_DIR..."
export GRU_DIR=/home/fabian/soft/GRU

#if [ "$HOSTNAME" = lyosrv024 ]; then
#    echo "> Connected to lyosrv024"
#	echo
#	echo -e "\t=> Sourcing gcc 8.0 as alias 'gcc'..."
#	source /data_sys/softs_matnuc/scripts/add2path.sh /data_sys/softs_matnuc/gcc72/install /lib /bin
#	alias gcc=gcc72
#	echo -e "\t=> Exporting $LD_LIBRARY_PATH to point to gcc 8.0 shared libs..."
#	export LD_LIBRARY_PATH='/data_sys/softs_matnuc/gcc72/install/lib:/data_sys/softs_matnuc/gcc72/install/lib32:/data_sys/softs_matnuc/gcc72/install/lib64:/data_sys/softs/mpfr_inst/lib:/data_sys/softs/mpc_inst/lib:/data_sys/softs/isl_inst/lib:/data_sys/softs/gmp_inst/lib'
#	#echo
#fi

#echo
#echo "what is about to happen"
# $command
#echo (if another command follows)



# This file echoes a bunch of color codes to the terminal to demonstrate
# what's available. Each line is the color code of one forground color,
# out of 17 (default + 16 escapes), followed by a test use of that color
# on all nine background colors (default + 8 escapes).
show_color_base ()
{
	T='gYw'   # The test text
	
	echo
	echo 'Usage (C/C++): \033[XXm (replace XX by a code, like 1;31m for bold red)'
	echo '   Reset with: \033[0m'
	echo -e "\n                 40m     41m     42m     43m     44m     45m     46m     47m";
	for FGs in '    m' '   1m' '  30m' '1;30m' '  31m' '1;31m' '  32m' '1;32m' '  33m' '1;33m' '  34m' '1;34m' '  35m' '1;35m' '  36m' '1;36m' '  37m' '1;37m';
	  do FG=${FGs// /}
	  echo -en " $FGs \033[$FG  $T  "
	  for BG in 40m 41m 42m 43m 44m 45m 46m 47m;
		do echo -en "$EINS \033[$FG\033[$BG  $T \033[0m\033[$BG \033[0m";
	  done
	  echo;
	done
	echo
}

# generates an 8 bit color table (256 colors) for
# reference purposes, using the \033[48;5;${val}m
# ANSI CSI+SGR (see "ANSI Code" on Wikipedia)
show_color_extended ()
{
	echo -en "\n   +  "
	for i in {0..35}; do
	  printf "%2b " $i
	done

	printf "\n\n %3b  " 0
	for i in {0..15}; do
	  echo -en "\033[48;5;${i}m  \033[m "
	done

	#for i in 16 52 88 124 160 196 232; do
	for i in {0..6}; do
	  let "i = i*36 +16"
	  printf "\n\n %3b  " $i
	  for j in {0..35}; do
		let "val = i+j"
		echo -en "\033[48;5;${val}m  \033[m "
	  done
	done

	echo -e "\n"
}

######################################
### THIS WAS IN THE INITIAL BASHRC ###
######################################

## ~/.bashrc: executed by bash(1) for non-login shells.
## see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
## for examples

## If not running interactively, don't do anything
#case $- in
#    *i*) ;;
#      *) return;;
#esac

## don't put duplicate lines or lines starting with space in the history.
## See bash(1) for more options
#HISTCONTROL=ignoreboth

## append to the history file, don't overwrite it
#shopt -s histappend

## for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
#HISTSIZE=1000
#HISTFILESIZE=2000

## check the window size after each command and, if necessary,
## update the values of LINES and COLUMNS.
#shopt -s checkwinsize

## If set, the pattern "**" used in a pathname expansion context will
## match all files and zero or more directories and subdirectories.
##shopt -s globstar

## make less more friendly for non-text input files, see lesspipe(1)
##[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

## set variable identifying the chroot you work in (used in the prompt below)
#if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
#    debian_chroot=$(cat /etc/debian_chroot)
#fi

## set a fancy prompt (non-color, unless we know we "want" color)
#case "$TERM" in
#    xterm-color|*-256color) color_prompt=yes;;
#esac

## uncomment for a colored prompt, if the terminal has the capability; turned
## off by default to not distract the user: the focus in a terminal window
## should be on the output of commands, not on the prompt
##force_color_prompt=yes

#if [ -n "$force_color_prompt" ]; then
#    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
#	# We have color support; assume it's compliant with Ecma-48
#	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
#	# a case would tend to support setf rather than setaf.)
#	color_prompt=yes
#    else
#	color_prompt=
#    fi
#fi

#if [ "$color_prompt" = yes ]; then
#    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
#else
#    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
#fi
#unset color_prompt force_color_prompt

## If this is an xterm set the title to user@host:dir
#case "$TERM" in
#xterm*|rxvt*)
#    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
#    ;;
#*)
#    ;;
#esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

#if [ -f ~/.bash_aliases ]; then
#    . ~/.bash_aliases
#fi

## enable programmable completion features (you don't need to enable
## this, if it's already enabled in /etc/bash.bashrc and /etc/profile
## sources /etc/bash.bashrc).
#if ! shopt -oq posix; then
#  if [ -f /usr/share/bash-completion/bash_completion ]; then
#    . /usr/share/bash-completion/bash_completion
#  elif [ -f /etc/bash_completion ]; then
#    . /etc/bash_completion
#  fi
#fi
