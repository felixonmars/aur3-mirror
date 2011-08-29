# Maintainer: Gadget3000 <gadget3000 at msn dot com>
# Contributor: froggie <sullivanva@gmail.com>
pkgname=netmaze
pkgver=0.81
pkgrel=2
pkgdesc="Smiley network shooter game"
url="ftp://sunsite.unc.edu/pub/Linux/games/multiplayer/mazewars/"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('libxext')
makedepends=('imake')
source=(ftp://sunsite.unc.edu/pub/Linux/games/multiplayer/mazewars/netmaze-0.81.tgz)
md5sums=('4fc906f82dcfeb9e10fa234331407d62')

build() {
  cd $srcdir/netmaze/
  patch -i ../../netmaze.diff
  touch netmaze.man netserv.man
  sed "s/share\/games/share/g" -i config.h
  xmkmf
  make || return 1
}
package() {
  cd $srcdir/netmaze/
  make DESTDIR=$pkgdir install
  install -d $pkgdir/usr/share/netmaze/{bitmaps,lib,mazes}/
  install -m 644 bitmaps/* $pkgdir/usr/share/netmaze/bitmaps/
  install -m 644 lib/* $pkgdir/usr/share/netmaze/lib/
  install -m 644 mazes/* $pkgdir/usr/share/netmaze/mazes/
}
