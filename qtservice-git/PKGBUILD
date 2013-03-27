# Maintainer: Christian Bühler <christian@cbuehler.de>
pkgname=qtservice-git
pkgver=20130327
pkgrel=1
pkgdesc="The QtService component is useful for developing Windows services and Unix daemons."
arch=('i686' 'x86_64')
url="http://qt.gitorious.org/qt-solutions/qt-solutions/trees/master/qtservice"
license=('LGPL')
makedepends=('git')

_gitroot=git://gitorious.org/qt-solutions/qt-solutions.git
_gitname=qt-solutions

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build/qtservice"

  ./configure -library
  qmake
  make
}

package() {
  cd "$srcdir/$_gitname-build/qtservice"
  mkdir -p "$pkgdir/usr/include"
  cp src/qtservice.h "$pkgdir/usr/include/"
  cp -r lib "$pkgdir/usr/"
}

# vim:set ts=2 sw=2 et:
