# Maintainer: Alfredo Palhares <masterkorp@masterkorp.net>
pkgname=lua-cliargs
pkgver=2.1
pkgrel=1
pkgdesc="A command-line argument parsing module for Lua."
arch=("any")
url="https://github.com/amireh/lua_cliargs"
license=('MIT')
depends=("lua")
source=(https://github.com/amireh/lua_cliargs/archive/v$pkgver.tar.gz)
md5sums=('8e66796e77af1e31923d71e3d9a5fdf1')

package() {
  cd "$srcdir/lua_cliargs-$pkgver"
  install -D -m644 "src/cliargs.lua" "$pkgdir/usr/lib/lua/5.2/cliargs.lua"
}

# vim:set ts=2 sw=2 et:
