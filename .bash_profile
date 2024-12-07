
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/ben/opt/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/ben/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/ben/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/ben/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export CLASSPATH=".:"

# Setting PATH for Python 3.10
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.10/bin:${PATH}"
export PATH
export LC_ALL=en_US.UTF-8
export PATH="/Users/ben/Programming/flutter/bin:$PATH"
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

# Required for termVim gruvbox color scheme to show properly
source ~/.vim/plugged/gruvbox/gruvbox_256palette.sh

# Quickly open a link/file in Google Chrome with "chrome [link]"
alias chrome="open -a 'Google Chrome'"
eval "$(/opt/homebrew/bin/brew shellenv)"

# load .bashrc
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

[[ -f ~/.bashrc ]] && source ~/.bashrc # ghcup-env