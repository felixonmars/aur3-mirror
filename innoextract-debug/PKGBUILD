# Maintainer: Daniel Scharrer <daniel@constexpr.org>

pkgname=innoextract-debug
_installname=innoextract
pkgver=1.2
pkgrel=1
pkgdesc='A tool to extract installers created by Inno Setup (debug build)'
url='http://innoextract.constexpr.org/'
arch=('i686' 'x86_64')
license=('ZLIB')
depends=('boost' 'xz')
optdepends=()
makedepends=('cmake')
conflicts=('innoextract')
provides=('innoextract')
options=(!strip)
source=("https://github.com/downloads/dscharrer/InnoExtract/${_installname}-${pkgver}.tar.gz")
sha256sums=('a56b11bab2e209c7b37a93b3bd7416eb7359824071fc3ae1cf16a8421747cb9a')

build() {
	cd "${srcdir}/${_installname}-${pkgver}"
	
	cmake . -DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Debug
	
	make
}

package() {
	cd "${srcdir}/${_installname}-${pkgver}"
	
	make DESTDIR="${pkgdir}" install
	
	install -Dm644 README.md \
		"${pkgdir}/usr/share/doc/${_installname}/README.md"
	install -Dm644 CHANGELOG \
		"${pkgdir}/usr/share/doc/${_installname}/CHANGELOG"
	install -Dm644 LICENSE \
		"${pkgdir}/usr/share/licenses/${_installname}/LICENSE"
}
