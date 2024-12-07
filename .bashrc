# Commonly accessed directories
CS="/Users/ben/Programming/Advanced\ CS/"     # Root folder for CS class

# Command aliases
alias python="python3"
alias pip="pip3"

export EDITOR="code -w"


# Compile and link assembly
function clas() {
    FILENAME=$1
    as $1
    ld -o ${FILENAME%.*} a.out \
        -lSystem \
        -syslibroot `xcrun -sdk macosx --show-sdk-path` \
        -e _start
    rm a.out
}

function javaclear() {
    find . -name '*.class' -type f -delete           # delete .class files
    find . -name '*.serial' -type f -delete          # delete .serial (serialization) files
}

# Pack java packages
function javapack() {
    # : ' ' is multiline comment (unofficially) [Note: you cannot use ' or escape with \']
    : '
    Alternate to zip specific files (without deleting everything else):
    find $DIR -name "*.pattern" -print0 | xargs -0 zip $DEST
    '
    javaclear
    local DIRNAME=$(mark)                           # basename of the directory
    cd ..                                           # go back
    local ZIPNAME="Olson_Benjamin_$DIRNAME.zip"     # name of the zip file
    if [ ! -d "Zipped" ]; then                      # make Zipped if needed
        mkdir Zipped
    fi
    if [ -f "$DIRNAME/.zipignore" ]; then
        zip -r "Zipped/$ZIPNAME" $DIRNAME -x "$(< "$DIRNAME/.zipignore")";               # zip project
    else 
        zip -r "Zipped/$ZIPNAME" $DIRNAME;               # zip project
    fi
        
    open Zipped
    cd $DIRNAME
}

function javatest() {
    javaclear && javac *.java && java $1
}

# Get the basename of the current working directory, even if pwd has spaces
function mark() {
    #| $PWD              is a variable to the current working directory (more efficient than $(pwd))
    #| string##pattern   removes the longest instance of `pattern` from the front
    #| */                 match all ending with / (the break for directories in a path)
    local result="${PWD##*/}"           # get the directory
    local result="${result// /\\ }"     # replace spaces with \[space]
    echo $result
}

function ip() {
    /sbin/ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'
}

function cmake-metal() {
    cmake . -B build && cmake --build build
}

function updateprograms() {
    # Homebrew
    brew update && brew upgrade
    # npm
    npm install -g npm-check-updates && ncu -u && npm fund
    # pip
    python3 -m pip3 install --upgrade pip3
    ## pip packages
    pip3 --disable-pip-version-check list --outdated --format=json | python3 -c "import json, sys; print('\n'.join([x['name'] for x in json.load(sys.stdin)]))"
    # Rust
    rustup update
}

# texgrep - searches for a text pattern contained in files
#   located inside the texmf trees
# usage: texgrep pattern [extension]
# usage examples:
#   texgrep phantomsection sty
#   texgrep \\\\def\\\\phantomsection
function texgrep() {
    if [ $# -eq 0 ]; then
        echo 1>&2 Usage: texgrep pattern [extension]
        exit 1
    fi
    for path in TEXMFMAIN TEXMFDIST TEXMFHOME
    do
        find `kpsewhich --var-value=$path` -type f -name "*$2" |xargs grep $1
    done
    exit 0
}


[ -f "/Users/ben/.ghcup/env" ] && source "/Users/ben/.ghcup/env" # ghcup-env
alias config='/usr/bin/git --git-dir=/Users/ben/.cfg/ --work-tree=/Users/ben'
