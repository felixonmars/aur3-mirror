# Maintainer: Splex

pkgname=llqtwebkit-git
pkgver=20100627
pkgrel=1
pkgdesc="An offscreen web page rendering library."
arch=('i686' 'x86_64')
url="http://omvviewer.byteme.org.uk/"
license=('GPL')
depends=('qt')
makedepends=('git')
provides=('llqtwebkit')

_gitroot="git://git.byteme.org.uk/home/git/llqtwebkit.git"
_gitname="llqtwebkit"

build() {
  cd $srcdir
  msg "Connecting to GIT server..."

  if [ -d $_gitname ]; then
    cd $_gitname && git pull origin
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  qmake -o Makefile -after "DEFINES+=VANILLA_QT" "CONFIG+=shared" "VERSION=2.1.0" llqtwebkit.pro || return 1
  make || return 1

  install -D -m755 llqtwebkit.h $pkgdir/usr/include/llqtwebkit.h
  install -D -m755 libllqtwebkit.so.2.1.0 $pkgdir/usr/lib/libllqtwebkit.so.2.1.0
  cp -P libllqtwebkit.{so,so.2,so.2.1} $pkgdir/usr/lib/
}
