# Contributor: Mark Richardson <echo@mit.edu>

pkgname=librfid
_realname=librfid
pkgver=0.2.0
pkgrel=1
depends=('libusb')
pkgdesc="This library intends to provide a reader and (as much as possible) PICC / tag independent API for RFID applications."
arch=(i686 x86_64)
url="http://openmrtd.org/projects/librfid/"
license=('GPL')
groups=('base')
provides=('librfid=0.2.0')
#conflicts=('librfid')
options=(!libtool)
source=(http://openmrtd.org/projects/$_realname/files/$_realname-$pkgver.tar.bz2)
md5sums=('b7f8014425ca38dc7649a461c30a5cd5')

build() {
  cd $startdir/src/$_realname-$pkgver
  ./configure --prefix=/usr --disable-build-docs
  make || return 1
  make DESTDIR=$startdir/pkg install
}
