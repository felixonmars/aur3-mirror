# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=lua-datadumper
pkgver=0.0.1
pkgrel=1
pkgdesc="Lua module to serialize/unserialize a table or object."
arch=(any)
url="http://lua-users.org/wiki/DataDumper"
license=('GPL')
depends=('lua')
source=("http://lua-users.org/files/wiki_insecure/dumper.lua")
md5sums=('f5d3e62f6ba957e7ff496f762c479887')

build() {
  return 0
}

package() {
  install -Dm644 "$srcdir/dumper.lua" "$pkgdir/usr/share/lua/5.1/DataDumper.lua"
}

# vim:set ts=2 sw=2 et:
