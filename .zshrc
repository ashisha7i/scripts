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

