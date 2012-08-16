# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=sopcast-player-svn
pkgver=298
pkgrel=1
pkgdesc='GUI front-end for p2p TV sopcast'
arch=('i686' 'x86_64')
url='http://code.google.com/p/sopcast-player/'
license=('GPL2')
depends=('gtk2' 'hicolor-icon-theme' 'pygtk' 'sopcast' 'vlc')
makedepends=('gettext')
options=('!makeflags')
source=$pkgname.install
md5sums=('0f088e605fc9ef60007f8a3ea9fbdff4')
install=$pkgname.install
conflicts=sopcast-player

_svntrunk=http://sopcast-player.googlecode.com/svn/trunk 
_svnmod=sopcast-player

build() {
  cd $srcdir

  svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cd $srcdir/sopcast-player

  # Python2 fix
  sed -i 's#PYTHON ?= /usr/bin/python#\02#' Makefile

  # Build
  make
  make DESTDIR=$pkgdir install
}