# Contributor: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>
# Contributor: shamrok <szamrok@gmx.net>
# Contributor: Gernot Pansy <notz@gmx.at>

pkgname=ktranslator
pkgver=0.4
pkgrel=3
pkgdesc="A program to translate words from one language to another (like Babylon)"
arch=("i686" "x86_64")
url="http://ktranslator.sourceforge.net/"
license=("GPL")
depends=("kdelibs3")
source=(http://prdownloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.bz2)

build() {
	cd "${srcdir}"/${pkgname}-${pkgver}

	# Config
	sed -i 's|#include <string>|#include <string>\n#include <cstring>|g' ./${pkgname}/plugins/babylon/libbab.cc

	./configure --prefix=/opt/kde --without-arts
	make
}

package() {
	cd "${srcdir}"/${pkgname}-${pkgver}

	make DESTDIR="${pkgdir}" install
}

sha1sums=('e73eebe7a55c82631028fde1fbf4df3f7f5d7caa')
