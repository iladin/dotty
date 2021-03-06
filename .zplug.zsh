function zzplug(){
    export ZPLUG_HOME="${ZDOTDIR:-$HOME}/.zplug"
    test -e $ZPLUG_HOME || git clone https://github.com/zplug/zplug $ZPLUG_HOME
    source ${ZDOTDIR:-$HOME}/.zplug/init.zsh
}
zzplug
# Git command template
# zplug "", as command
zplug "jayphelps/git-blame-someone-else", as:command
zplug "felixSchl/git-fiddle", as:command
zplug "Fakerr/git-recall", as:command
zplug "k4rthik/git-cal", as:command
zplug "mchav/with", as:command
zplug "mrowa44/emojify",  as:command
zplug "iladin/swim",  as:command
zplug "gitbits/git-info", as:command
zplug "gitbits/git-ls-branches", as:command
zplug "gitbits/git-shift", as:command

zplug "willemmali-sh/chegit", \
    as:command, \
    from:gitlab

zplug "monochromegane/the_platinum_searcher", \
    as:command, \
    from:gh-r, \
    rename-to:"pt", \
    frozen:1

zplug "peco/peco", \
    as:command, \
    from:gh-r, \
    frozen:1

zplug "b4b4r07/peco-tmux.sh", \
    as:command, \
    use:'*.sh', \
    rename-to:'peco-tmux'

zplug "philovivero/distribution", \
    as:command, \
    use:distribution, \
    if:'(( $+commands[perl] ))'

zplug "jhawthorn/fzy", \
    as:command, \
    hook-build:"PREFIX=${ZDOTDIR:-$HOME} && make && make install"

function zplug_end() {
    if ! zplug check --verbose; then
        zplug install
    fi
    zplug load --verbose
}
zplug_end
