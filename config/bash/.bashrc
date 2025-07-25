# Get the basename of the current working directory, even if pwd has spaces
function mark() {
    #| $PWD              is a variable to the current working directory (more efficient than $(pwd))
    #| string##pattern   removes the longest instance of `pattern` from the front
    #| */                 match all ending with / (the break for directories in a path)
    local result="${PWD##*/}"       # get the directory
    local result="${result// /\\ }" # replace spaces with \[space]
    echo $result
}

function ip() {
    /sbin/ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'
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
    for path in TEXMFMAIN TEXMFDIST TEXMFHOME; do
        find $(kpsewhich --var-value=$path) -type f -name "*$2" | xargs grep $1
    done
    exit 0
}

# export DBUS_SESSION_BUS_ADDRESS="unix:path=$DBUS_LAUNCHD_SESSION_BUS_SOCKET"
