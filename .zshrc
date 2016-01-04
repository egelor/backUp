# ~/.zshrc 
# Puredyne zsh config

# misc
setopt nohup # Don't kill jobs when logout

# theme -------------------------------------------------------------
# prompt
PS1=$'%{\e[1;36m%}(%{\e[34m%}%30<..<%~%{\e[36m%}) %{\e[36m%}%#%b %{\e[0m%}'
if [ "`id -u`" -eq 0 ]; then
export RPS1=$'%{\e[37m%}%{\e[1;30m%}%{\e[7m%} %M %{\e[0m%}'
else
export RPS1=$'%{\e[37m%}%{\e[1;30m%} %M %{\e[0m%}'
fi
# colors
eval `dircolors -b ~/.dircolors`


# completion --------------------------------------------------------
zstyle ':completion:*' menu select=1  # completion menu
# ssh host completion
[ -f ~/.ssh/config ] && : ${(A)ssh_config_hosts:=${${${${(@M)${(f)"$(<~/.ssh/config)"}:#Host *}#Host }:#*\**}:#*\?*}}
[ -f ~/.ssh/known_hosts ] && : ${(A)ssh_known_hosts:=${${${(f)"$(<$HOME/.ssh/known_hosts)"}%%\ *}%%,*}}
zstyle ':completion:*:*:*' hosts $ssh_config_hosts $ssh_known_hosts

unsetopt list_ambiguous         # prompt after 1st tab
setopt glob_dots                # completion for dot files
 
# bells -------------------------------------------------------------
unsetopt beep		# no beep
unsetopt hist_beep	# no beep
unsetopt list_beep	# no beep

# aliases -----------------------------------------------------------
# ls stuff
alias  hard= 'mount -t vfat -o umask=000 /dev/sda1 /media/disk'
alias constantine='cd ~/Documents/COMICS/Hellblazer\ \(001\ -\ 300\)\ \(complete\) '
alias ls='ls --classify --color=auto --human-readable --time-style=locale'
alias l='ls'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lsa='ls -ld .*'
alias lsd='ls -ld *(-/DN)'
alias threejs= 'cd /var/www/livecodelab-master'
# handy 
alias df='df --human-readable'
alias du='du --human-readable'
alias grep='grep --color=always'
alias cd='cd'
alias pythonbook='cd /home/egelor/Apps/eGelor_Programming/BOOK/Python/Python_TCSE3-3rd-examples/src/py/intro'
alias books='cd /home/egelor/Apps/eGelor_Programming/BOOKS'
alias ofxOpenCv='cd /home/egelor/Apps/eGelor_Programming/ofxOpenCv'
alias Emacs_Projects='/home/egelor/Apps/eGelor_Programming/Emacs_Projects'
alias Unix='home/egelor/Apps/eGelor_Programming/Unix'
alias apt='sudo apt-get install'
alias opencv_eng_folder='cd /usr/local/share/opencv'
alias opencv_Ap_folder='cd /home/egelor/Apps/OpenCV-2/OpenCV-2.3.0'
alias opencvcompile=' gcc `pkg-config --cflags opencv` `pkg-config --libs opencv` -o '

alias interfaces='sudo nano /etc/network/interfaces'
# Convert ogv to flv.
# Usage: ogv2flv input.ogv -o output.flv
# add -audiofile yoursound.wav if you need to replace the soundtrack
alias ogv2flv='mencoder -of lavf -oac mp3lame -lameopts abr:br=56 -srate 22050 -ovc lavc -lavcopts vcodec=flv:vbitrate=250:mbd=2:mv0:trell:v4mv:cbp:last_pred=3 -vf scale=640:480'

# various -----------------------------------------------------------
unsetopt ignore_eof 	# Ctrl+D acts like a 'logout'
setopt print_exit_value # print exit code if different from '0'
unsetopt rm_star_silent # confirmation asked for 'rm *'

# buddies -----------------------------------------------------------
watch=(notme)                   	# watch for everybody but me
LOGCHECK=300                    	# check activity every 5 min
WATCHFMT='%n %a %l from %m at %t.'	# watch display

# history -----------------------------------------------------------
export HISTORY=1600
export SAVEHIST=1600
export HISTFILE=$HOME/.history
setopt hist_verify		# prompt before execution


# colorful manpages
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;37m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# -------------------------------------------------------------------
autoload -U compinit 
compinit

#Python ege

export scripting=$HOME/scripting
export PYTHONAPATH=$scripting/src/tools
PATH=$PATH:$scripting/src/tools

#VST
export DSSI_PATH=/usr/lib/dssi
export VST_PATH=/usr/lib/dssi/dssi-vst.so:/home/egelor/.wine/drive_c/audio/KORG:/home/egelor/.wine/drive_c/Program\ Files/Steinberg/Vstplugins/LINPLUG




[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh # This loads NVM
