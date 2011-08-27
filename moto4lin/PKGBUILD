# Contributer: bubx <junkdraxg@gmail.com>

pkgname=moto4lin
pkgver=0.3
pkgrel=1
pkgdesc="Software to be used with Motorola telephones based on the P2K platform. It allows file system manipulations with Motorola phones."
arch=('i686' 'x86_64')
url="http://moto4lin.sourceforge.net/wiki/Main_Page"
license=('GPL2')
depends=('qt3>=3.3' 'libusb' 'zlib' 'gcc')
source=(http://switch.dl.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.bz2)
md5sums=('f9e5edbc08a45ac98679e4d34d5e3574')

build() {
cd $startdir/src/$pkgname-$pkgver
cd moto_ui
QTDIR=/opt/qt/
/opt/qt/bin/qmake || return 1
make || return 1
make INSTALL_ROOT=$startdir/pkg install || return 1
}
