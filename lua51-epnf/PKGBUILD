# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname='lua51-epnf'
pkgdesc='Extended PEG Notation Format (easy grammars for LPeg)'
pkgver='0.2'
pkgrel='2'
url='http://siffiejoe.github.io/lua-luaepnf/'
license='custom'
arch='any'
depends=('lua51' 'lua51-lpeg')
source=("https://github.com/siffiejoe/lua-luaepnf/archive/v${pkgver}.tar.gz"
	'LICENSE')
sha512sums=('2bcd1194a895dcc146437d218ac105d693b0eb2614e653c2f638c075b1733fd025dbc5be5cffe9a034d28cc5f41fe5e72c2e817f33967c0cc4a2207fdf6bafe4'
            'cad8d00fd7c0562792c2575baf9a79077b488fd3565d7d31b35459a28259c3a73506397490a68d9f0a1a8235627ad96fdd3deeb32fa32b91ec82cd98064d46ba')

build () {
	:
}

package () {
	cd "lua-luaepnf-${pkgver}"
	install -Dm644 src/epnf.lua \
		"${pkgdir}/usr/share/lua/5.1/epnf.lua"
	install -Dm644 doc/readme.txt \
		"${pkgdir}/usr/share/doc/${pkgname}/readme.txt"
	install -Dm644 "${srcdir}/LICENSE" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
