pkgname=subsync
pkgver=0.2.0
pkgrel=1
pkgdesc="Simple CLI tool that synchronizes SubRip (srt) subtitles automatically."
arch=('i686' 'x86_64')
url=https://github.com/oblique/subsync
license=(BSD)
provides=('subsync')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/oblique/${pkgname}/archive/v${pkgver}.tar.gz")
sha1sums=('932f3e474f2dface94977ab78d51490ee4238834')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -D subsync "${pkgdir}/usr/bin/subsync"
}

