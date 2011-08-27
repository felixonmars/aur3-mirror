# Contributor: Franz Burgmann <f dot burgmann at gmail dot com>

pkgname=vdr-dvdswitch
pkgver=0.1.3
pkgrel=2
pkgdesc="VDR-Plugin to play Video-DVD images from hard disk"
arch=('i686' 'x86_64')
url="http://www.vdr-portal.de/board/thread.php?threadid=49165"
license=('GPL')
depends=('vdr' 'vdr-dvd')
makedepends=('vdr')
backup=()
source=(http://download.schmidtie.de/vdr-dvdswitch-current.tar.bz2)
md5sums=()

build() {
  cd $srcdir/dvdswitch-$pkgver
  
  patch -p1 -i ../../90_dvdswitch-0.1.3-1.5.4.dpatch
  
  make VDRDIR="/usr/src/VDR" LIBDIR="." all || return 1

  mkdir -p $pkgdir/usr/lib/vdr || return 1
  cp libvdr-*.so.* $pkgdir/usr/lib/vdr/ || return 1
}
