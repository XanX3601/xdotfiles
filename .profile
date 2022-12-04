# **************************************************************************** #
# BASH PROFILE
# **************************************************************************** #

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# bashrc ***********************************************************************
# souce global bashrc if it exists

if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# source bashrc if it exists

if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# some settings ****************************************************************
# avoid coredumps, no idea what it does
ulimit -S -c 0
set -o notify
set -o noclobber
set -o ignoreeof

shopt -s cdable_vars # to cd on a directory stored in a variable
shopt -s cdspell # to avoird mistake while cd
shopt -s checkhash # to check if command exists in the hash table
shopt -s checkwinsize # to resize bash window after each command
shopt -s sourcepath # do not really understand how that works
shopt -s no_empty_cmd_completion
shopt -s cmdhist # to have multiplie line command saved as one
shopt -s histappend histreedit histverify
shopt -s extglob

# no mail altert
shopt -u mailwarn
unset MAILCHECK

# colors ***********************************************************************
# Normal Colors
Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White

# Bold
BBlack='\033[1;30m'       # Black
BRed='\033[1;31m'         # Red
BGreen='\033[1;32m'       # Green
BYellow='\033[1;33m'      # Yellow
BBlue='\033[1;34m'        # Blue
BPurple='\033[1;35m'      # Purple
BCyan='\033[1;36m'        # Cyan
BWhite='\033[1;37m'       # White

# Background
On_Black='\033[40m'       # Black
On_Red='\033[41m'         # Red
On_Green='\033[42m'       # Green
On_Yellow='\033[43m'      # Yellow
On_Blue='\033[44m'        # Blue
On_Purple='\033[45m'      # Purple
On_Cyan='\033[46m'        # Cyan
On_White='\033[47m'       # White

NC="\033[m"               # Color Reset

ALERT=${BWhite}${On_Red}

# Greetings ********************************************************************
echo -e "${BBlack}black${NC}"
echo -e "${BRed}black${NC}"
echo -e "${BGreen}black${NC}"
echo -e "${BYellow}black${NC}"
echo -e "${BBlue}black${NC}"
echo -e "${BPurple}black${NC}"
echo -e "${BCyan}black${NC}"
echo -e "${BWhite}black${NC}"

function _exit()
{
    echo -e "${BRed}I'll be back${NC}"
}
trap _exit EXIT

# shell prompt *****************************************************************
# test connection type
if [ -n "${SSH_CONNECTION}" ]; then      # connected to remote machine, via ssh
    CNX=${GREEN}
elif [[ "${DISPLAY%%:0*}" != "" ]]; then # connected on remote machine, not via ssh
    CNX=${ALERT}
else                                     # connected on local machine
    CNX=${BCyan}
fi

# test user type
if [[ ${USER} == "root" ]]; then       # user is root 
    SU=${Red}
elif [[ ${USER} != $(logname) ]]; then # user is not login user
    SU=${BRed}
else                                   # user is normal
    SU=${BCyan}
fi

PROMPT_COMMAND="history -a"
case ${TERM} in
  *term | rxvt | linux | alacritty )
        PS1="\[${BPurple}\][\A\[${NC}\] "
        # Time of day (with load info):
        PS1="\[${BPurple}\][\A\[${NC}\] "
        # User@Host (with connection type info):
        PS1=${PS1}"\[${SU}\]\u\[${NC}\]@\[${CNX}\]\h\[${NC}\] "
        # PWD (with 'disk space' info):
        PS1=${PS1}"\[${BGreen}\]\W]\[${NC}\] "
        # Prompt (with 'job' info):
        PS1=${PS1}"\[${BYellow}\]>\[${NC}\] "
        # Set title of current xterm:
        PS1=${PS1}"\[\e]0;[\u@\h] \w\a\]"
        ;;
    *)
        PS1="(\A \u@\h \W) > " # --> PS1="(\A \u@\h \w) > "
                               # --> Shows full pathname of current dir.
        ;;
esac

# Aliases **********************************************************************
# prevent overwriting files
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"

# create intermediate subdirectories
alias mkdir='mkdir -p'

# ls
alias ll='ls -al --color'

# Path *************************************************************************
