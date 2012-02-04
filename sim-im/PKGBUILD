# Contributer: markuman <markuman@gmail.com> 

pkgname=sim-im
pkgver=svn20060208
pkgrel=1
pkgdesc="sim instant messanger"
url="http://sim-im.berlios.de"
license="gpl"
depends=(libxml2 openssl kdelibs zip qt libxslt glibc)
source=(http://download.berlios.de/sim-im/sim-svn20060208.tar.bz2)
md5sums=(eb649a847a276807b24fd3237c49cc04)

build() {
  cd $startdir/src/$pkgname-$pkgver
  make -f admin/Makefile.common
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
