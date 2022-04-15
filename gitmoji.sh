#!/bin//bash

usage () {
    cat << EOF # remove the space between << and EOF, this is due to web plugin issue
    Usage: $(basename "${BASH_SOURCE[0]}") [-h] [-v] [-f] -p param_value arg1 [arg2...]

    Script description here.

    Available options:

    -h, --help      Print this help and exit
    -o, --options   Print all emoji options
EOF
    
    exit
}


options () {
    cat << EOF # option emoji
    🎨 structure     💄 UI              💚 fixCI            ➖ remdep
    ⚡️ performance   🎉 begin           ⬇️  downdeo          🔧 config
    🔥 remove        ✅ test            ⬆️  updep            🔨 devscript
    🐛 bug           🔒️ security        📌 pindep           🌐  local
    🚑️ critical      🔐 secrets         👷 updateCI         ✏️ typo
    ✨ newfeat       🔖 release         📈 analytics        💩 bad
    📝 docs          🚨 compiler        ♻️  refactor         ⏪️ rewind
    🚀 deploy        🚧 wip             ➕ adddep           🔀 merge
    📦️ package       🍻 beer            📱 responsive       🌱 seed
    👽️ external      💬 text            🤡 mock             🚩 flag
    🚚 move          🗃️  database        🥚 egg              🥅 catcherror
    📄 license       🔊 addlogs         🙈 gitignore        💫 anime
    💥 breaking      🔇 rmlogs          📸 snapshot         🗑️ deprecate
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


parse_params () {
    while :; do
        case "${1-}" in
            -h | --help) usage ;;
            -o | --verbose) options ;;
            -?*) die "Unknown option: $1" ;;
            *) break ;;
        esac
        shift
    done
    
    args=("$@")
}


parse_params "$@"