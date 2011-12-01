# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Gour <gour@mail.inet.hr>
# Contributor: Sergej Pupykin

pkgname=emacs-muse-git
pkgver=20111201
pkgrel=1
pkgdesc="Publishing environment for Emacs"
url="http://mwolson.org/projects/EmacsMuse.html"
arch=('any')
license=('GPL3')
depends=('emacs')
optdepends=('python2: for experimental mathml-support')
conflicts=('emacs-muse')
provides=('emacs-muse')
install=emacs-muse.install
source=()
md5sums=()
_gitroot=git://repo.or.cz/r/muse-el.git
_gitname=muse

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  [ -d "$srcdir/$_gitname-build" ] && rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #

  # python2 fix,  
  sed -i 's_#!/usr/bin/env python_#!/usr/bin/env python2_' \
    experimental/muse-mathml.el

  cp Makefile.defs.default Makefile.defs
  sed -i -e "s|\(PREFIX.*= \)/usr/local|\1/usr|" Makefile.defs
  make
  cd examples
  make
}
package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR=$pkgdir install
  install -d $pkgdir/usr/share/doc/emacs-muse
  cp -r examples scripts $pkgdir/usr/share/doc/emacs-muse
}
