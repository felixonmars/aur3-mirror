# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname='lua51-repl'
pkgdesc='A Lua REPL implemented in Lua for embedding in other programs'
pkgver='0.4'
pkgrel='1'
arch='any'
license='custom'
url='https://github.com/hoelzro/lua-repl'
source=("${url}/archive/${pkgver}.tar.gz")
depends=('lua51' 'bash')
optdepends=('lua51-linenoise: Improved line editing and history'
            'rlwrap: Support for line editing and history')
sha512sums=('473ccaf0adfe15884d48d8f5e0ccf34ad62b9936262fa71aa59991cc58d7a996dbea2b437a6a5cabdb27d49f6baf05c5322cfcfd1a473834edbd9e4064d4468f')

prepare () {
	cd "lua-repl-${pkgver}"
	cat > rep.lua.sh <<-EOF
	#! /bin/sh
	exec /usr/bin/lua5.1 /usr/share/lua/5.1/rep.lua
	EOF
}

build () {
	:
}

package () {
	cd "lua-repl-${pkgver}"
	install -Dm644 rep.lua \
		"${pkgdir}/usr/share/lua/5.1/rep.lua" 
	cp -r repl "${pkgdir}/usr/share/lua/5.1" 
	install -Dm755 "rep.lua.sh" \
		"${pkgdir}/usr/bin/rep.lua"
	install -Dm644 COPYING \
		"${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
	install -Dm644 plugins.md \
		"${pkgdir}/usr/doc/${pkgname}/plugins.md"
}
