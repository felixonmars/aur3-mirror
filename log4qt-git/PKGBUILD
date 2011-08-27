# Maintainer: Tim Besard <tim.besard@gmail.com>

pkgname=log4qt-git
pkgver=20110505
pkgrel=1
pkgdesc="Log4Qt is a C++ port of the Apache Software Foundation Log4j package using the Trolltech Qt Framework. It is intended to be used by open source and commercial Qt projects."
arch=('i686' 'x86_64')
url="http://gitorious.org/log4qt"
license=('LGPL')
groups=('meego')
depends=('qt')
makedepends=('git' 'cmake')
provides=('log4qt')
conflicts=('log4qt')

_gitroot="git://gitorious.org/log4qt/log4qt.git"
_gitname="log4qt"

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
  
  cmake -DQT_USE_QTSQL=TRUE -DQT_USE_QTNETWORK=TRUE -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
} 

