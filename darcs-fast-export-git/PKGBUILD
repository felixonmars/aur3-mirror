# Maintainer: Jeff 'codemac' Mickey <jeff@archlinux.org>
pkgname=darcs-fast-export-git
pkgver=20100227
pkgrel=1
pkgdesc="Dump a darcs repository in a format understud by \"fast importers\" such as git-fast-import."
arch=('any')
url="http://vmiklos.hu/project/darcs-fast-export"
license=('GPL')
depends=('python')
makedepends=('git' 'asciidoc')
provides=('darcs-fast-export')
conflicts=('darcs-fast-export')
options=('zipman')
md5sums=() #generate with 'makepkg -g'

_gitroot="git://vmiklos.hu/darcs-fast-export"
_gitname="$pkgname"

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

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #

  sed -i "s#/usr/bin/install#/bin/install#" Makefile
  make || return 1
  make DESTDIR="$pkgdir/" install
} 
