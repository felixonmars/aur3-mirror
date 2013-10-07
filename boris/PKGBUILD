# Maintainer: Capi Etheriel <barraponto [at] gmail [dot] com>
pkgname=boris
pkgver=1.0.5
pkgrel=1
pkgdesc="A tiny REPL for PHP"
arch=('any')
url="https://github.com/d11wtq/${pkgname}"
license=('MIT')
depends=('php' 'readline')
install="${pkgname}.install"
source=("${url}/archive/v${pkgver}.tar.gz")
md5sums=('0dad72a77e67a5c83a199ba07deaadb1')

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
