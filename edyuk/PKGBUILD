pkgname=edyuk
pkgver=1.1.0
pkgrel=2
pkgdesc="A Development Environment for Qt4"
arch=('i686' 'x86_64')
url="http://edyuk.org/"
license="GPL"
depends=('qt')
source=(http://downloads.tuxfamily.org/edyuk/edyuk-${pkgver}.tar.bz2)
md5sums=('9c5e89a631db9690c3b0f6afd1d51338')


build() {
cd $startdir/src/$pkgname-$pkgver/
qmake
sed 's#INSTALL_DIR   = $(COPY_DIR)#INSTALL_ROOT = '$startdir/pkg# -i Makefile
make || return 1
make install
install -Dm 755 edyuk.bin $pkgdir/usr/bin
}
