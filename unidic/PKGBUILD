# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=unidic
pkgver=2.1.2
_sfver=58338
pkgrel=1
pkgdesc="A morphological analysis dictionary for mecab"
arch=('any')
url="http://www.ninjal.ac.jp/corpus_center/unidic/"
license=('GPL LGPL BSD')
depends=('mecab')
source=("http://iij.dl.sourceforge.jp/unidic/${_sfver}/unidic-mecab-${pkgver}_src.zip")

build() {
	cd "${srcdir}/unidic-mecab-${pkgver}_src"
	./configure --prefix=/usr
	make
}

package() {
	mkdir "${pkgdir}/usr"
	mkdir "${pkgdir}/usr/share"
	mkdir "${pkgdir}/usr/share/licenses"
	mkdir "${pkgdir}/usr/share/licenses/${pkgname}"

	cd "${srcdir}/unidic-mecab-${pkgver}_src"
	make DESTDIR="$pkgdir" install
	install -Dm644 COPYING GPL LGPL BSD "${pkgdir}/usr/share/licenses/${pkgname}"
}

md5sums=('547ce5824429a022d6fe368af39a106c')
