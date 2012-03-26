# Maintainer: Christian Bühler <christian@cbuehler.de>
pkgname=qt-quick3d-git
pkgver=20120326
pkgrel=2
pkgdesc="The Qt Quick module for scripting 3D applications in QML"
arch=('i686' 'x86_64')
url="http://doc.qt.nokia.com/qt-quick3d-snapshot/"
license=('LGPL')
depends=('qt')
makedepends=('git')

_gitroot=git://gitorious.org/qt/qt3d.git
_gitname=qt3d

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone -b qt4 "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone -b qt4 "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  qmake CONFIG+=package
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  INSTALL_ROOT="$pkgdir" make install
}

# vim:set ts=2 sw=2 et:
