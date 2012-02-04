# Maintainer: sancospi <sancospi@gmail.com>

pkgname=rhythmbox-folderview
pkgver=1
pkgrel=2
pkgdesc="Rhythmbox Plugin To Browse Your Music By Folders"
arch=('i686' 'x86_64')
license=('GPL3')
url="http://code.google.com/p/folderview"
depends=('rhythmbox')
makedepends=('subversion')
install=(plugin.install)

build() {
  cd $srcdir
  svn checkout http://folderview.googlecode.com/svn/trunk/ folderview
  mkdir -p $pkgdir/usr/lib/rhythmbox/plugins/
  cp -R $srcdir/folderview $pkgdir/usr/lib/rhythmbox/plugins/
}
