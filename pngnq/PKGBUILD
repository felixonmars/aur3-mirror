# Maintainer: N30N <archlinux@alunamation.com>
# Contributer: panthar <panthar@gmail.com>
# Contributer: cryptocrack <archlinux@cryptocrack.de>
# Contributer: llevkin <llevkin@yandex.ru>

pkgname="pngnq"
pkgver=1.1
pkgrel=2
pkgdesc="Pngnq is a tool for quantizing PNG images in RGBA format"
url="http://pngnq.sourceforge.net/"
license=("BSD")
arch=("i686" "x86_64")
depends=("libpng")
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=("fdbb94d504931b50c54202b62f98aa44")

prepare() {
	cd "${pkgname}-${pkgver}"
	sed "35i#include <zlib.h>" -i src/rwpng.c
}

build() {
	cd "${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}
package() {
	cd "${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make DESTDIR="${pkgdir}" install
}

# vim: set noet ff=unix:
