# Maintainer: Max Roder <maxroder@web.de>

pkgname='zams'
pkgver='1.0'
_pkgdate='20120415'
pkgrel='1'
pkgdesc='Allows offline usage of the german medical exams training data (Mediscript DVD)'
url='http://zams.sourceforge.net/'
arch=('x86_64' 'i686')
license=('GPL')
depends=('qtwebkit')
install="${pkgname}.install"
source=("http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}-${_pkgdate}-source.tar.gz"
	"http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-conv-${pkgver}-${_pkgdate}-source.tar.gz"
	"http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-entry-${pkgver}-${_pkgdate}-source.tar.gz")

sha256sums=('4bb218a707f2163b4c342336d6e5929195ec638bc5e9a98bfab23aa9ef9a3f93'
	'4b8f21669a6834847ffdb89ae74fffaaec56369664fad5b3e1fa5738a17cf09b'
	'd08b19ee0da33283245a041c6a827d911a5303a180e1aad1e5eeb040515fb005')

build() {
	cd "${srcdir}/zams/zams/"
	qmake
	make

	cd "${srcdir}/zams-conv/zams-conv/"
	qmake
	make

	cd "${srcdir}/zams-entry/zams-entry/"
	qmake
	make
}

package() {
	# remove unnecessary files
	find "${srcdir}" -name "COPYING" -exec rm -f {} \;

	cd "${srcdir}/zams/zams/"
	make INSTALL_ROOT="${pkgdir}" install

	cd "${srcdir}/zams-conv/zams-conv/"
	make INSTALL_ROOT="${pkgdir}" install

	cd "${srcdir}/zams-entry/zams-entry/"
	make INSTALL_ROOT="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
