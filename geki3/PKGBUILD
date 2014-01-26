# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=geki3
pkgver=1.0.3
pkgrel=1
pkgdesc="A horizontal shoot'em-up game similar to classic arcade games"
arch=('i686' 'x86_64')
url="http://packages.debian.org/source/sid/geki3"
license=('GPL')
depends=('kxl' 'libx11')
source=("http://ftp.debian.org/debian/pool/main/g/geki3/geki3_${pkgver}.orig.tar.gz")

build() {
	cd "${srcdir}/geki3-KXL-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/geki3-KXL-${pkgver}"
	make DESTDIR="${pkgdir}" install
}

md5sums=('0e7d1f87af08b9ddc50e3c7bec6ebe14')
