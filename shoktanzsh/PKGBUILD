#!/bin/sh
# Maintainer: Wisthler <wisthler at gmail dot com>
pkgname=shoktanzsh
pkgver=20100901
pkgrel=1
pkgdesc="A set of configuration files for the zsh shell"
arch=('i686' 'x86_64')
url="http://wisthler.tonbnc.fr/blog/archives/2010/08/12/shoktanzsh/"
license=('MIT')
depends=('zsh' 'figlet' 'archey' 'mpd' 'ncmpcpp' 'mplayer')
makedepends=('git')
replaces=('')
groups=('shoktan-base')

_gitroot="git://gitorious.org/zsh-shoktan/zsh-shoktan.git"
_gitname="zsh-shoktan"
_gitbranche="master"

build() {
  cd "$srcdir"

  msg2 "Connecting to gitorious ..."

  if [ -d $_gitname ] ; then
    ( cd $_gitname && git pull )
  else
    git clone -b $_gitbranche $_gitroot $_gitname || return 1
  fi

  #msg2 "Starting installation"
  
  #mkdir etc
  #mv "$_gitname" etc/zsh.d
  #ln -s etc/zsh.d/zshrc etc/zshrc
  
  msg2 "Installation done"
}

package(){
    cd "$pkgdir"
    mkdir etc
    mv "$srcdir/$_gitname" etc/zsh  
}
