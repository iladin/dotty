#!/bin/bash

set -u


function xwidgets(){
 apt-get -qq update
 apt-get install -y stow build-essential libx11-dev texinfo xaw3dg-dev \
     libjpeg-dev libpng12-dev libgif-dev libtiff5-dev libncurses5-dev \
     libxft-dev librsvg2-dev libmagickcore-dev libmagick++-dev \
     libxml2-dev libgpm-dev libotf-dev libm17n-dev \
     libgnutls-dev wget make texinfo autoconf automake \
     perl libgtk-3-dev libwebkitgtk-3.0-dev
     #TODO figure out way for it to work always
    git clone git://git.sv.gnu.org/emacs.git
    cd emacs && ./autogen.sh && ./configure --with-x-toolkit=gtk3 --with-xwidgets  && make
}

function easySnapshot(){
     add-apt-repository -y ppa:ubuntu-elisp
     apt-get update
     apt-get install emacs-snapshot
}
#TODO take in arguements.

#easySnapshot
xwidgets

# Build latest version of Emacs, version management with stow
# OS: Ubuntu 14.04 LTS and newer
# version: 24.5
# Toolkit: lucid

function old(){
readonly version="24.5"

# install dependencies
 apt-get -qq update
 apt-get -qq install -y stow build-essential libx11-dev xaw3dg-dev \
     libjpeg-dev libpng12-dev libgif-dev libtiff5-dev libncurses5-dev \
     libxft-dev librsvg2-dev libmagickcore-dev libmagick++-dev \
     libxml2-dev libgpm-dev libotf-dev libm17n-dev \
     libgnutls-dev wget make gcc-core gcc-g++ autoconf automake \
     perl libpoppler-devel libpoppler-glib-devel libgtk-3-dev
cd $TMPDIR

# download source package
if [[ ! -d emacs-"$version" ]]; then
   wget http://ftp.gnu.org/gnu/emacs/emacs-"$version".tar.xz
   tar xvf emacs-"$version".tar.xz
fi

# build and install
mkdir -p /usr/local/stow
cd emacs-"$version"
./configure \
    --with-xft \
    --with-x-toolkit=lucid

make
 make \
    install-arch-dep \
    install-arch-indep \
    prefix=/usr/local/stow/emacs-"$version"

cd /usr/local/stow
stow emacs-"$version"
}
