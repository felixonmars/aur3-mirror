# Maintainer: Mathieu Gaborit <mat.gaborit@gmx.com>

pkgname=heekscad-svn
pkgver=1
pkgrel=1
pkgdesc="Computer-aided design application based on OCE"
arch=('i686', 'x86_64')
url="https://code.google.com/p/heekscad"
license=('custom:BSD3')
depends=('python2' 'wxgtk2.8' 'gtkglext' 'opencascade' 'hicolor-icon-theme' 'xdg-utils' 'libarea-svn')
makedepends=('subversion' 'cmake')
provides=('heekscad')
conflicts=('heekscad' 'heekscad-git')

_svntrunk=http://heekscad.googlecode.com/svn/trunk
_svnmod=trunk

prepare () {

  cd $srcdir
  msg "Cloning svn repository..."

  if [[ -d $_svnmod/.svn ]]; then
    cd $_svnmod
    svn update
  else
    svn checkout $_svntrunk $_svnmod
  fi
}

build () {

  cd $srcdir
  mkdir build/ && cd build/
  cmake -DCMAKE_INSTALL_PREFIX=$pkgdir/usr -DwxWidgets_wxrc_EXECUTABLE='/usr/bin/wxrc-2.8' -DwxWidgets_CONFIG_EXECUTABLE='/usr/bin/wx-config-2.8' ../$_svnmod
  make
}

package() {
  make -C $srcdir/build install
  install -Dm644 $srcdir/$_svnmod/COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim: et sw=2 ts=2
