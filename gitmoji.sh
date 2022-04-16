#!/bin//bash

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
    🎨 structure     💄 ui              💚 fixci            ➖ remdep
    ⚡️ performance   🎉 begin           ⬇️  downdep          🔧 config
    🔥 remove        ✅ test            ⬆️  updep            🔨 devscript
    🐛 bug           🔒️ security        📌 pindep           🌐 local
    🚑️ critical      🔐 secrets         👷 updateCI         ✏️  typo
    ✨ newfeat       🔖 release         📈 analytics        💩 bad
    📝 docs          🚨 compiler        ♻️  refactor         ⏪️ rewind
    🚀 deploy        🚧 wip             ➕ adddep           🔀 merge
    📦️ package       🍻 beer            📱 responsive       🌱 seed
    👽️ external      💬 text            🤡 mock             🚩 flag
    🚚 move          🗃️  database        🥚 egg              🥅 catcherror
    📄 license       🔊 addlogs         🙈 gitignore        💫 anime
    💥 breaking      🔇 rmlogs          📸 snapshot         🗑️  deprecate
    🍱 assets        👥 contributors    ⚗️  experiment       🛂 auth
    ♿️ access        🚸 ux              🔍️ seo              🩹 simplefix
    💡 comments      🏗️  arch            🏷️  types            🧐 inspect
    ⚰️  dead
    🧪 failtest
    👔 business
    🩺 health
    🧱 infra
    🧑‍💻 devx
EOF
    
    exit
}


emoji_selector () { # selects emoji given input
    case "$1" in
        structure) emoji=🎨 ;;
        performance) emoji=⚡️ ;;
        remove) emoji=🔥 ;;
        bug) emoji=🐛 ;;
        critical) emoji=🚑️ ;;
        newfeat) emoji=✨ ;;
        docs) emoji=📝 ;;
        deploy) emoji=🚀 ;;
        package) emoji=📦️ ;;
        external) emoji=👽️ ;;
        move) emoji=🚚 ;;
        license) emoji=📄 ;;
        breaking) emoji=💥 ;;
        assets) emoji=🍱 ;;
        access) emoji=♿️ ;;
        comments) emoji=💡 ;;
        dead) emoji=⚰️ ;;
        failtest) emoji=🧪 ;;
        business) emoji=👔 ;;
        health) emoji=🩺 ;;
        infra) emoji=🧱 ;;
        devx) emoji=🧑‍💻 ;;
        ui) emoji=💄 ;;
        begin) emoji=🎉 ;;
        test) emoji=✅ ;;
        security) emoji=🔒️ ;;
        secrets) emoji=🔐 ;;
        release) emoji=🔖 ;;
        compiler) emoji=🚨 ;;
        wip) emoji=🚧 ;;
        beer) emoji=🍻 ;;
        text) emoji=💬 ;;
        database) emoji=🗃️ ;;
        addlogs) emoji=🔊 ;;
        rmlogs) emoji=🔇 ;;
        contributors) emoji=👥 ;;
        ux) emoji=🚸 ;;
        arch) emoji=🏗️ ;;
        fixci) emoji=💚 ;;
        downdep) emoji=⬇️ ;;
        updep) emoji=⬆️ ;;
        pindep) emoji=📌 ;;
        updateci) emoji=👷 ;;
        analytics) emoji=📈 ;;
        refactor) emoji=♻️ ;;
        adddep) emoji=➕ ;;
        responsive) emoji=📱 ;;
        mock) emoji=🤡 ;;
        egg) emoji=🥚 ;;
        gitignore) emoji=🙈 ;;
        snapshot) emoji=📸 ;;
        experiment) emoji=⚗️ ;;
        seo) emoji=🔍️ ;;
        types) emoji=🏷️ ;;
        remdep) emoji=➖ ;;
        config) emoji=🔧 ;;
        devscript) emoji=🔨 ;;
        local) emoji=🌐 ;;
        typo) emoji=✏️ ;;
        bad) emoji=💩 ;;
        rewind) emoji=⏪️ ;;
        merge) emoji=🔀 ;;
        seed) emoji=🌱 ;;
        flag) emoji=🚩;;
        catcherror) emoji=🥅 ;;
        anime) emoji=💫 ;;
        deprecate) emoji=🗑️ ;;
        auth) emoji=🛂 ;;
        simplefix) emoji=🩹 ;;
        inspect) emoji=🧐 ;;
        *) emojicode=$1
            emoji="none" ;;
    esac
    return 0
}


commit() { # shows changes and commits with gitmoji message if Y/y is selected
    git status -s -b
    
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
    elif ["$message" == '']; then
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