# Maintainer: Laszlo Papp (djszapi2 at gmail com)
DLAGENTS=('http::/usr/bin/wget -c -U Mozilla -t 3 --waitretry=3 -O %o %u')
pkgname=z80asmide
pkgver=1.32
pkgrel=3
pkgdesc="An IDE for Linux, similar to Assembly Studio"
url="http://www.ticalc.org/pub/unix/"
license=('GPL')
depends=('gtk2' 'shared-mime-info' 'hicolor-icon-theme' 'xdg-utils')
arch=('i686')
install=z80asmide.install
source=("http://www.ticalc.org/pub/unix/${pkgname}.tar.gz")
md5sums=('6b6529066429226dc41d5000e63d9873')

build() {
	cd ${srcdir}/$pkgname-$pkgver
  	make || return 1
  	make DESTDIR=${pkgdir} install || return 1
}
