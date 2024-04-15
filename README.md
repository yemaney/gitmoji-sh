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
Download the file and save it to:
- `~/usr/local/bin`

Then edit your .bashrc and .bash_profile files to include the following
### .bashrc
```sh
alias gitmoji='~/usr/local/bin/gitmoji.sh'
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
gitmoji -h
```

    Gitmoji is bash script, designed to help with using emoji in git commit messages.
    The available emoji's are consistent with the https://gitmoji.dev/ project.

    Usage: gitmoji.sh [-e emoji] [-m "commit message"]

    Available options:

    -h, --help      Print this help and exit
    -o, --options   Print all emoji options and exit
    -e, --emoji     emoji to use in commit message
    -m, --message   message to use in commit message
    -s, --sign      Sign the commit using GPG

## Options
```sh
gitmoji -o
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