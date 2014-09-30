pkgname=lua51-linenoise
pkgver=0.6.1
_pkgver=${pkgver/\./}
_pkgver="0.${_pkgver/\./-}"
pkgrel=1
pkgdesc='Lua bindings for linenoise.'
arch=('x86_64' 'i686')
url='https://github.com/hoelzro/lua-linenoise'
license=('MIT/X11')
depends=('lua51')
source=("${url}/archive/${_pkgver}.tar.gz")
sha512sums=('2138f810450ba8298670b452fd3346aff13ff996f3fe750649ca55e8641ec56be8c934466f8532500ed08a48c757e4fc50ff10acc47131ebf20f94f391543691')

build () {
	cd "lua-linenoise-${_pkgver}"
	make
}

package() {
	cd "lua-linenoise-${_pkgver}"
	install -Dm755 linenoise.so \
		"${pkgdir}/usr/lib/lua/5.1/linenoise.so"
	for file in example.lua README.md readline-readme.md ; do
		install -Dm644 "${file}" \
			"${pkgdir}/usr/share/doc/${pkgname}/${file}"
	done
}

