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
    🎨 structure     💄 UI              💚 fixCI            ➖ remdep
    ⚡️ performance   🎉 begin           ⬇️  downdeo          🔧 config
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
    🍱 assets        👥 contributers    ⚗️  experiment       🛂 auth
    ♿️ access        🚸 UX              🔍️ seo              🩹 simplefix
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


parse_params () { # parses flags and controls which functio gets called
    while :; do
        case "${1-}" in
            -h | --help) usage ;;
            -o | --verbose) options ;;
            -?*) echo "Unknown option: {$1}" ;;
            *) break ;;
        esac
        shift
    done
    
    args=("$@")
}


parse_params "$@"