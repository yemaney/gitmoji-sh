#!/bin/bash

usage () {
    cat << EOF # describes script usage, triggerred by -h | --help

    Gitmoji is bash script, designed to help with using emoji in git commit messages.
    The available emoji's are consistent with the https://gitmoji.dev/ project.

    Usage: $(basename "${BASH_SOURCE[0]}") [-e emoji] [-m "commit message"]

    Available options:

    -h, --help      Print this help and exit
    -o, --options   Print all emoji options and exit
    -e, --emoji     emoji to use in commit message
    -m, --message   message to use in commit message
EOF
    
    exit
}


options () {
    cat << EOF # prints emoji options, triggerd by -o | --options
    ๐จ structure     ๐ ui              ๐ fixci            โ remdep
    โก๏ธ performance   ๐ begin           โฌ๏ธ  downdep          ๐ง config
    ๐ฅ remove        โ test            โฌ๏ธ  updep            ๐จ devscript
    ๐ bug           ๐๏ธ security        ๐ pindep           ๐ local
    ๐๏ธ critical      ๐ secrets         ๐ท updateCI         โ๏ธ  typo
    โจ newfeat       ๐ release         ๐ analytics        ๐ฉ bad
    ๐ docs          ๐จ compiler        โป๏ธ  refactor         โช๏ธ rewind
    ๐ deploy        ๐ง wip             โ adddep           ๐ merge
    ๐ฆ๏ธ package       ๐ป beer            ๐ฑ responsive       ๐ฑ seed
    ๐ฝ๏ธ external      ๐ฌ text            ๐คก mock             ๐ฉ flag
    ๐ move          ๐๏ธ  database        ๐ฅ egg              ๐ฅ catcherror
    ๐ license       ๐ addlogs         ๐ gitignore        ๐ซ anime
    ๐ฅ breaking      ๐ rmlogs          ๐ธ snapshot         ๐๏ธ  deprecate
    ๐ฑ assets        ๐ฅ contributors    โ๏ธ  experiment       ๐ auth
    โฟ๏ธ access        ๐ธ ux              ๐๏ธ seo              ๐ฉน simplefix
    ๐ก comments      ๐๏ธ  arch            ๐ท๏ธ  types            ๐ง inspect
    โฐ๏ธ  dead
    ๐งช failtest
    ๐ business
    ๐ฉบ health
    ๐งฑ infra
    ๐งโ๐ป devx
EOF
    
    exit
}


emoji_selector () { # selects emoji given input
    case "$1" in
        structure) emoji=๐จ ;;
        performance) emoji=โก๏ธ ;;
        remove) emoji=๐ฅ ;;
        bug) emoji=๐ ;;
        critical) emoji=๐๏ธ ;;
        newfeat) emoji=โจ ;;
        docs) emoji=๐ ;;
        deploy) emoji=๐ ;;
        package) emoji=๐ฆ๏ธ ;;
        external) emoji=๐ฝ๏ธ ;;
        move) emoji=๐ ;;
        license) emoji=๐ ;;
        breaking) emoji=๐ฅ ;;
        assets) emoji=๐ฑ ;;
        access) emoji=โฟ๏ธ ;;
        comments) emoji=๐ก ;;
        dead) emoji=โฐ๏ธ ;;
        failtest) emoji=๐งช ;;
        business) emoji=๐ ;;
        health) emoji=๐ฉบ ;;
        infra) emoji=๐งฑ ;;
        devx) emoji=๐งโ๐ป ;;
        ui) emoji=๐ ;;
        begin) emoji=๐ ;;
        test) emoji=โ ;;
        security) emoji=๐๏ธ ;;
        secrets) emoji=๐ ;;
        release) emoji=๐ ;;
        compiler) emoji=๐จ ;;
        wip) emoji=๐ง ;;
        beer) emoji=๐ป ;;
        text) emoji=๐ฌ ;;
        database) emoji=๐๏ธ ;;
        addlogs) emoji=๐ ;;
        rmlogs) emoji=๐ ;;
        contributors) emoji=๐ฅ ;;
        ux) emoji=๐ธ ;;
        arch) emoji=๐๏ธ ;;
        fixci) emoji=๐ ;;
        downdep) emoji=โฌ๏ธ ;;
        updep) emoji=โฌ๏ธ ;;
        pindep) emoji=๐ ;;
        updateci) emoji=๐ท ;;
        analytics) emoji=๐ ;;
        refactor) emoji=โป๏ธ ;;
        adddep) emoji=โ ;;
        responsive) emoji=๐ฑ ;;
        mock) emoji=๐คก ;;
        egg) emoji=๐ฅ ;;
        gitignore) emoji=๐ ;;
        snapshot) emoji=๐ธ ;;
        experiment) emoji=โ๏ธ ;;
        seo) emoji=๐๏ธ ;;
        types) emoji=๐ท๏ธ ;;
        remdep) emoji=โ ;;
        config) emoji=๐ง ;;
        devscript) emoji=๐จ ;;
        local) emoji=๐ ;;
        typo) emoji=โ๏ธ ;;
        bad) emoji=๐ฉ ;;
        rewind) emoji=โช๏ธ ;;
        merge) emoji=๐ ;;
        seed) emoji=๐ฑ ;;
        flag) emoji=๐ฉ;;
        catcherror) emoji=๐ฅ ;;
        anime) emoji=๐ซ ;;
        deprecate) emoji=๐๏ธ ;;
        auth) emoji=๐ ;;
        simplefix) emoji=๐ฉน ;;
        inspect) emoji=๐ง ;;
        *) emojicode=$1
            emoji="none" ;;
    esac
    return 0
}


commit() { # shows changes and commits with gitmoji message if Y/y is selected
    git diff --name-status --staged 
    
    echo "

    Would you like to commit these changes with the message:
    "$emoji : $message"

    Yes: Y/y
    No: N/n
    "
    read -p "Enter selection > "
    
    case $REPLY in
        Y | y)
            git commit -m "$emoji : $message"
        ;;
        *)
            exit 1
        ;;
    esac
}


die() { # exit the program and print a message when an erorr has occurred
    msg=$1
    echo "$msg"
    exit 1
}


catch_errors() { # catch errros with emoji or message Options
    if [ "$emoji" == "none" ]; then
        die "Error: $emojicode is not a valid emoji code. Try gitmoji -o for more information."
    elif [ "$message" == '' ]; then
        die "Error: commit message was empty. Try gitmoji -h for more information."
    fi
}


parse_params () { # parses flags and controls which functio gets called
    emojicode=''
    emoji=''
    message=''
    while :; do
        case "${1-}" in
            -h | --help) usage ;;
            -o | --options) options ;;
            -e | --emoji) 
                emoji_selector "$2"
                shift
            ;;
            -m | --message) 
                message="$2"
                shift
            ;;
            -?*)
                 die "Error: $1 is an invalid option:. Try gitmoji -h for more information.";;
            *) 
                break ;;
        esac
        shift
    done
    
    catch_errors

    args=("$@")
    
    commit
}


parse_params "$@"