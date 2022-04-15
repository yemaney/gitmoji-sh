# gitmoji-sh
Gitmoji Bash Script
- [gitmoji-sh](#gitmoji-sh)
  - [Abstact](#abstact)
  - [Quick Example](#quick-example)
  - [Installation](#installation)
    - [.bashrc](#bashrc)
    - [.bash_profile](#bash_profile)
  - [Help](#help)
  - [Options](#options)

## Abstact
Gitmoji is bash script, designed to help with using emoji in git commit messages.
The available emoji's are consistent with the https://gitmoji.dev/ project.


## Quick Example
```sh
gitmoji -e comments -m "Improving comments in source code"
```

    ## main...origin/main
    M README.md


        Would you like to commit these changes with the message:
        💡 : Improving comments in source code

        Yes: Y/y
        No: N/n

    Enter selection >

## Installation
Download the file and save it in `one` of the locations:
- personal use: `~/bin`
- everyone: `~/usr/local/bin`
- sys admin: `~/usr/local/sbin`

Then edit you .bashrc and .bash_profile files to include the following
### .bashrc
```sh
alias gitmoji='~/localsh/gitmoji.sh'
```
### .bash_profile
```sh
# Source the ~/.bashrc file if it exists
if [ -f ~/.bashrc ]
then
    . ~/.bashrc
fi
```

## Help
```sh
gitmoji.sh -h
```
    Usage: gitmoji.sh [-h] [-o]

    Gitmoji is bash script, designed to help with using emoji in git commit messages.
    The available emoji's are consistent with the https://gitmoji.dev/ project.

    Available options:

    -h, --help      Print this help and exit
    -o, --options   Print all emoji options and exit
    -e, --emoji     emoji to use in commit message
    -m, --message   message to use in commit message

    Example:

    $ gitmoji -e comments -m "Improving comments in source code"

## Options
```sh
gitmoji.sh -o
```

    🎨 structure     💄 ui              💚 fixci             ➖ remdep
    ⚡️ performance   🎉 begin           ⬇️  downdep          🔧 config
    🔥 remove        ✅ test            ⬆️  updep            🔨 devscript
    🐛 bug           🔒️ security        📌 pindep            🌐 local
    🚑️ critical      🔐 secrets         👷 updateCI          ✏️  typo
    ✨ newfeat       🔖 release         📈 analytics         💩 bad
    📝 docs          🚨 compiler        ♻️  refactor         ⏪️ rewind
    🚀 deploy        🚧 wip             ➕ adddep            🔀 merge
    📦️ package       🍻 beer            📱 responsive        🌱 seed
    👽️ external      💬 text            🤡 mock              🚩 flag
    🚚 move          🗃️  database       🥚 egg               🥅 catcherror
    📄 license       🔊 addlogs         🙈 gitignore         💫 anime
    💥 breaking      🔇 rmlogs          📸 snapshot          🗑️  deprecate
    🍱 assets        👥 contributors    ⚗️  experiment       🛂 auth
    ♿️ access        🚸 ux              🔍️ seo               🩹 simplefix
    💡 comments       🏗️  arch           🏷️  types            🧐 inspect
    ⚰️  dead
    🧪 failtest
    👔 business
    🩺 health
    🧱 infra
    🧑‍💻 devx