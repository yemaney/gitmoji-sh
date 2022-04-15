#!/bin//bash

usage () {
    cat << EOF # describes script usage, triggerred by -h | --help

    Usage: $(basename "${BASH_SOURCE[0]}") [-h] [-o]

    Gitmoji is bash script, designed to help with using emoji in git commit messages.
    The available emoji's are consistent with the https://gitmoji.dev/ project.

    Available options:

    -h, --help      Print this help and exit
    -o, --options   Print all emoji options
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
    emoji="$1"
    case "$2" in
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
        inspect) emoji=🧐
    esac
    return 0
}

parse_params () { # parses flags and controls which functio gets called
    emoji=''
    while :; do
        case "${1-}" in
            -h | --help) usage ;;
            -o | --verbose) options ;;
            -e | --emoji) emoji_selector "$emoji" "$2" ;;
            -?*) echo "Unknown option: {$1}" ;;
            *) break ;;
        esac
        shift
    done
    echo "Selected $emoji"
    args=("$@")
}

parse_params "$@"