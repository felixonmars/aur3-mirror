pkgname=diskfree
pkgver=0.16pre1
pkgrel=1
pkgdesc="Free Disk Space Applet for Kicker"
url="http://www.ricardis.tudelft.nl/~vincent/diskfree/download/"
license="GPL"
depends=('kdelibs')
source=(http://www.ricardis.tudelft.nl/~vincent/diskfree/download/$pkgname-0.16-pre1.tar.gz)
md5sums=('569b345f16396c1e17a7a0a74f63887f')

build() {
  cd $startdir/src/$pkgname-0.16-pre1
  ./configure --prefix=/opt/kde
  make || return 1
  make DESTDIR=$startdir/pkg install
}
