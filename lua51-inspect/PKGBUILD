# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname='lua51-inspect'
pkgdesc='Transforms any Lua value into a human-readable representation.'
pkgver='3.0.0'
pkgrel='1'
arch='any'
license='custom'
url='https://github.com/kikito/inspect.lua'
source=("${url}/archive/v3.0.0.tar.gz")
depends=('lua51')
sha512sums=('4876d9f49147a1bb06b06f91d1c56ce5250d9ccd6e211194a80a30389b6a8f6d99e7cd48811d8fe9a935845662fda164109af4dd63a0f2a911c330980983ce01')

build () {
	:
}

package () {
	cd "inspect.lua-${pkgver}"
	install -Dm644 inspect.lua \
		"${pkgdir}/usr/share/lua/5.1/inspect.lua"
	install -Dm644 README.md \
		"${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 MIT-LICENSE.txt \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
