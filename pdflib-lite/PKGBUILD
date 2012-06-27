# Contributor: Olivier Mehani <shtrom-arch@ssji.net>
# $Id: PKGBUILD 251 2010-07-23 01:14:18Z shtrom $

pkgname=pdflib-lite
_pkgnamecaps=PDFlib-Lite
pkgver=7.0.5p3
_basepkgver=${pkgver/p*/}
pkgrel=1
pkgdesc="PDF manipulation library."
url="http://www.pdflib.com"
arch=(i686 x86_64)
provides=('pdflib')
source=(http://www.pdflib.com/binaries/PDFlib/${_basepkgver//./}/${_pkgnamecaps}-${pkgver}.tar.gz http://www.pdflib.com/fileadmin/pdflib/pdf/license/PDFlib-Lite-license.pdf)
license=(custom:pdflib-lite)

build() {
	cd $srcdir/$_pkgnamecaps-$pkgver
	./configure --prefix=/usr
	make || return 1
	make prefix=$pkgdir/usr install
	mkdir -p $pkgdir/usr/share/pdflib-lite/doc

	## Copy files required by the license
	# Documentation
	cp $srcdir/$_pkgnamecaps-$pkgver/doc/pdflib/* \
		$pkgdir/usr/share/pdflib-lite/doc
	mkdir -p $pkgdir/usr/share/licenses/pdflib-lite
	# License
	cp -H $srcdir/PDFlib-Lite-license.pdf $pkgdir/usr/share/licenses/pdflib-lite/LICENSE.pdf
	# Examples
	make -C $srcdir/$_pkgnamecaps-$pkgver/bind/pdflib clean
	cp -R $srcdir/$_pkgnamecaps-$pkgver/bind/pdflib/{c,cpp,java} \
		$pkgdir/usr/share/pdflib-lite
	find $pkgdir/usr/share/pdflib-lite \( \
		-name Makefile \
		-o -name *.dsp \
		-o -name *.dsw \
		-o -name *.sln \
		-o -name *.vcproj \
		\) -exec rm {} \;
}

md5sums=('371d332d610a8b21a542bb7a2bdaf954'
         '2f3f9cc20199aad91b33dc26cdcbbab4')
