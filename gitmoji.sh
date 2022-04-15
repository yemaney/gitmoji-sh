#!/bin//bash

usage () {
    cat << EOF # remove the space between << and EOF, this is due to web plugin issue
    Usage: $(basename "${BASH_SOURCE[0]}") [-h] [-v] [-f] -p param_value arg1 [arg2...]

    Script description here.

    Available options:

    -h, --help      Print this help and exit
EOF
    
    exit
}


parse_params () {
    while :; do
        case "${1-}" in
            -h | --help) usage ;;
            -?*) die "Unknown option: $1" ;;
            *) break ;;
        esac
        shift
    done
    
    args=("$@")
}


parse_params "$@"