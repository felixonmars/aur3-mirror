# Maintainer: Vinycius Maia <suportevg@uol.com.br>

pkgname=fltk11-bin
pkgver=1.1.10
pkgrel=1
pkgdesc="This was the most established and stable version, mainly because the lead developers had a lot of commercial code that depended on it."
arch=('x86_64')
url="http://www.fltk.org"
license=('GPL')
source=('http://pessoal-debs.googlecode.com/files/libfltk-1.1.10.tar.gz')
md5sums=('6aae92adf5bc19064f6360d017754753')

package() {
	cd "$srcdir"
	mkdir -p "${pkgdir}/usr/share/doc"
	install -m 644 ANNOUNCEMENT CHANGES COPYING CREDITS README "${pkgdir}/usr/share/doc"
	cp -R lib "${pkgdir}/usr/"
}
