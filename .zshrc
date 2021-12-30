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

# Customize to your needs...

# Define variables for ANSI Colors
ANSI_NONE='\033[0m'
ANSI_BLACK='\033[0;30m'
ANSI_RED='\033[0;31m'
ANSI_GREEN='\033[0;32m'
ANSI_ORANGE='\033[0;33m'
ANSI_BLUE='\033[0;34m'
ANSI_YELLOW='\033[1;33m'
ANSI_WHITE='\033[1;37m'
NC='\033[0m'

## Use Example: printf "I ${RED}love${NC} ANSI Colors\n"

# Utility function to reload the modified .zshrc
function reload() {
    source ~/.zshrc
}

# Custom function to load/unload GPVPN client (Requires GPVPN client installed)
function gpvpn() {
    if [ "$#" -ne 1 ]; then
        echo -e "\n ${ANSI_BLUE}Usage:${NC} ${ANSI_GREEN}gpvpn${NC} ${ANSI_YELLOW}on${NC}|${ANSI_YELLOW}off${NC}\n"
    elif [ "$1" = "on" ]; then
        launchctl load /Library/LaunchAgents/com.paloaltonetworks.gp.pangp*
    elif [ "$1" = "off" ]; then
        launchctl unload /Library/LaunchAgents/com.paloaltonetworks.gp.pangp*
    fi
}

# Custom function to set iTerm window/Tab title
function settitle() {
    echo -e "\033];$1\007"
}

# Custom function to convert EPOCH milliseconds to Date Time
function epochmilli() {
    echo
    echo "\t`date -r $(($1/1000))`"
    echo
}

# Custom function to convert EPOCH seconds to readable Date Time
function epochsec() {
    echo
    echo "\t`date -r $1`"
    echo
}

# Custom function to clone git repos
function gitclone() {
    hostsArray=()

    while read line;
    do
        if [[ $line == "Host "* ]];
        then
            echo $line
            hostsArray+=(`echo "$line" | awk -F" " '{print $2}'`)
        fi
    done < ~/.ssh/config


    # Display the hosts as choices to the user
    echo "
${ANSI_BLUE}Please select a host below:${ANSI_NONE}
    "
    PS3="
Select the host: "
    select selectedHost in $hostsArray;
    do
        if (($hostsArray[(Ie)$selectedHost])); then                                                                                                                                                                              ☕
            echo "${ANSI_YELLOW}Selected $selectedHost${ANSI_NONE}"
            cmnd="git clone $1"
            shift
            c=`echo "${cmnd/github.com/$selectedHost} $*"`
            echo ""
            echo "${ANSI_BLUE}Running command$ANSI_ORANGE \n\n\t$c\n$ANSI_NONE"
            eval $c
            break
        else
            echo "${ANSI_RED}Invalid selection${ANSI_NONE}"
        fi

    done
}

function mkcd() {
    mkdir $1
    cd $1
}


# Aliases
alias typora="open -a typora"
