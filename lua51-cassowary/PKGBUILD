# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname='lua51-cassowary'
pkgdesc='A port of the cassowary constraint solver engine to lua'
pkgver='1.0'
pkgrel='1'
arch='any'
url='https://github.com/simoncozens/cassowary.lua'
depends=('lua51')
license='Apache'
source=("${url}/archive/v${pkgver}.tar.gz")
sha512sums=('b7d628b43ad610161c350a5bcd827ab523fa26c5afef1842bbb7dfff90210b26b633684824ff4b8cdca98f57b8b2a2f3d2e9ceec4f240e5e9503801a550d8403')

package () {
	cd "cassowary.lua-${pkgver}"
	install -Dm644 cassowary.lua \
		"${pkgdir}/usr/share/lua/5.1/cassowary.lua"
	install -Dm644 README.md \
		"${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

