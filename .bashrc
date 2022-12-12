# external files ***************************************************************
# alacritty
source ~/.bash_completion/alacritty

# cargo
source ~/.cargo/env

# path *************************************************************************
# local bin
export PATH=/home/xan/.local/bin:$PATH

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

# prompt ***********************************************************************
PS1="\[${BBlue}\]"
PS1=${PS1}"["
PS1=${PS1}"\A "
PS1=${PS1}"\u@\h "
PS1=${PS1}"\[${NC}\]"
PS1=${PS1}"\[${BGreen}\]"
PS1=${PS1}"\W"
PS1=${PS1}"\[${BBlue}\]"
PS1=${PS1}"]"
PS1=${PS1}" > "
PS1=${PS1}"\[${NC}\]"

# aliases **********************************************************************
alias ll="exa -a -l --icons"
alias ls="exa"

alias venv="source venv/bin/activate"
