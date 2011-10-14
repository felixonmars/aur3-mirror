# Maintainer: L42y <423300@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Anders Bergh <anders1@gmail.com>

pkgname=lua-lzlib
pkgver=0.4_work3
pkgrel=1
pkgdesc="Lua interface to zlib"
arch=('i686' 'x86_64')
url="http://luaforge.net/projects/lzlib/"
license=('custom')
depends=('lua' 'zlib')

source=(http://files.luaforge.net/releases/${pkgname/lua-/}/${pkgname/lua-/}/${pkgname/lua-/}-${pkgver/_/-}/${pkgname/lua-/}-${pkgver/_/-}.tar.gz
        license.txt)
md5sums=('7cbe61f0287ee407b8562103c632bb73'
         'fc22ecccadddd8ad646aca9c5eb7d23a')

build() {
	cd ${srcdir}/lzlib-${pkgver/_/-}

	make
}

package() {
	cd ${srcdir}/lzlib-${pkgver/_/-}

	install -Dm644 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
	install -Dm755 zlib.so ${pkgdir}/usr/lib/lua/5.1/zlib.so
	install -Dm644 gzip.lua ${pkgdir}/usr/share/lua/5.1/gzip.lua
}
