

function nosudo(){
git clone git://git.code.sf.net/p/zsh/code zsh

cd zsh

autoconf

# Options from Ubuntu Zsh package rules file (http://launchpad.net/ubuntu/+source/zsh)
./configure --prefix=$HOME \
            --mandir=$HOME/man \
            --bindir=$HOME/bin \
            --infodir=$HOME/usr/share/info \
            --enable-maildir-support \
            --enable-etcdir=$HOME/etc/zsh \
            --enable-function-subdirs \
            --enable-site-fndir=$HOME/usr/local/share/zsh/site-functions \
            --enable-fndir=$HOME/usr/share/zsh/functions \
            --with-tcsetpgrp \
            --with-term-lib="ncursesw" \
            --enable-cap \
            --enable-pcre \
            --enable-readnullcmd=pager \
            LDFLAGS="-Wl,--as-needed -g"

make

make check

make install
}
function wsudo(){
    sudo apt-get update && sudo apt-get install zsh
}
sudo -l apt-get && wsudo || nosudo
