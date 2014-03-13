# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=mdxplay
pkgver=20070206
pkgrel=1
pkgdesc="MDX player for UNIX-like environment"
arch=('i686' 'x86_64')
url="http://homepage3.nifty.com/StudioBreeze/software/mdxplay-e.html"
license=('GPL')
depends=('alsa-lib' 'gcc-libs')
source=("http://homepage3.nifty.com/StudioBreeze/software/bin/mdxplay-${pkgver}.tar.gz" Makefile.patch)

build() {
	cd "${srcdir}/mdxplay-${pkgver}"
	./configure --prefix=/usr --mandir=/usr/share/man
	cd "${srcdir}/mdxplay-${pkgver}/mdxplay"
	patch < "${srcdir}/Makefile.patch"
	cd "${srcdir}/mdxplay-${pkgver}"
	make
}

package() {
	cd "${srcdir}/mdxplay-${pkgver}"
	make DESTDIR="${pkgdir}" install
}

md5sums=('94757a37c697aee8fbdab5ca2a0ab4f9'
         '2c462176d0ab2e9dd09f5d4481fc9ec8')
