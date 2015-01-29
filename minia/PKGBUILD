# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=minia
pkgver=1.6906
pkgrel=1
pkgdesc="A short-read assembler based on a de Bruijn graph"
arch=('i686' 'x86_64')
url="http://minia.genouest.org/"
license=('custom:CeCILL')
depends=('bc' 'gcc-libs' 'zlib')
source=("http://minia.genouest.org/files/minia-${pkgver}.tar.gz")

build() {
	cd "${srcdir}/minia-${pkgver}"
	make
}

package() {
	cd "${srcdir}/minia-${pkgver}"
	install -Dm755 minia "${pkgdir}/usr/bin/${pkgname}"
	
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

md5sums=('ab4da58695f713025bba2e8144ee1d15')
