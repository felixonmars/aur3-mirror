# Maintainer: Alfredo Palhares <masterkorp@masterkorp.net>

pkgname=lua-say
pkgver=1.2
pkgrel=1
pkgdesc="Lua string hashing library, useful for internationalization"
arch=(any)
url="https://github.com/Olivine-Labs/say"
license=('MIT')
depends=(
  "lua"
)
changelog=
source=(https://github.com/downloads/Olivine-Labs/say/say-$pkgver.tar.gz)
md5sums=('362e0743cffbb1a4cb2227cc93216efd')

package() {
  cd "$srcdir/say"
  install -D -m644 "src/init.lua" "$pkgdir/usr/lib/lua/5.2/say/init.lua"
  install -D -m644 "README.md" "$pkgdir/usr/share/doc/say/README.md"
}

# vim:set ts=2 sw=2 et:
