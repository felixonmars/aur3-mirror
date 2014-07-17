# Maintainer: Menche <menche_mt at yahoo dot com>

pkgname=sw-git
pkgver=20140428.5473436
pkgrel=1
pkgdesc='A minimal and sane web framework.'
arch=('any')
url='https://github.com/jroimartin/sw'
license=('MIT')
source=("git+https://github.com/jroimartin/sw.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/sw"
	git log -1 --date=short --format="%cd.%h" | tr -d '-'
}

build() {
	cd "${srcdir}/sw"
	make PREFIX=/usr all
}

package() {
	cd "${srcdir}/sw"
	make PREFIX=/usr DESTDIR="${pkgdir}" install

	mkdir -p "${pkgdir}/usr/share/sw"
	install style.css "${pkgdir}/usr/share/sw"
	install sw.conf "${pkgdir}/usr/share/sw"

	mkdir -p "${pkgdir}/usr/share/doc/sw"
	install README "${pkgdir}/usr/share/doc/sw"
}

