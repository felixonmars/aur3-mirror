# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=geki2
pkgver=2.0.3
pkgrel=1
pkgdesc="A vertical shoot'em-up game similar to classic arcade games"
arch=('i686' 'x86_64')
url="http://packages.debian.org/source/sid/geki2"
license=('GPL')
depends=('kxl' 'libx11')
source=("http://ftp.debian.org/debian/pool/main/g/geki2/geki2_${pkgver}.orig.tar.gz")

build() {
	cd "${srcdir}/geki2-KXL-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/geki2-KXL-${pkgver}"
	make DESTDIR="${pkgdir}" install
}

md5sums=('9bb542ea15a4e6b5f51164c19cc0a674')
