# Maintainer: N30N <archlinux@alunamation.com>
# Contributor: Tybo <thibault.porteboeuf@m4x.org>

pkgname="exrtools"
pkgver=0.4
pkgrel=2
pkgdesc="A collection of utilities for manipulating OpenEXR images"
url="http://scanline.ca/exrtools/"
license=("custom")
arch=("i686" "x86_64")
depends=("openexr" "libpng" "libjpeg")
makedepends=("openexr" "libpng" "libjpeg")
source=("http://scanline.ca/exrtools/${pkgname}-${pkgver}.tar.gz")
md5sums=("8533e98f78f70d8180fe6865bc383f06")

build() {
	cd ${pkgname}-${pkgver}
	sed "30i#include <zlib.h>" -i src/pngoutput.c
	./configure --prefix=/usr
	make
}

package() {
	cd ${pkgname}-${pkgver}
	make DESTDIR=${pkgdir} install
	install -D -m644 COPYING ${pkgdir}/usr/share/licenses/${pkgname}
}

# vim: set noet ff=unix
