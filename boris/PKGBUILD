# Maintainer: Capi Etheriel <barraponto [at] gmail [dot] com>
pkgname=boris
pkgver=1.0.8
pkgrel=1
pkgdesc="A tiny REPL for PHP"
arch=('any')
url="https://github.com/d11wtq/${pkgname}"
license=('MIT')
depends=('php' 'readline')
install="${pkgname}.install"
source=("${url}/archive/v${pkgver}.tar.gz")
md5sums=('0e16b555383a67c3a08be918b7cc1633')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	# fix the include path for the bin file
	sed -i -e "s*__DIR__.'/../lib*'/usr/lib/boris*" bin/boris
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -d ${pkgdir}/usr/lib/${pkgname}/
	cp -rf lib/* ${pkgdir}/usr/lib/${pkgname}/
	install -Dm755 bin/boris "${pkgdir}/usr/bin/boris"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
