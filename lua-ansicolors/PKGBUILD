# Maintainer: Alfredo Palhares <masterkorp@masterkorp.net>

pkgname=lua-ansicolors
pkgver=1.0.2
pkgrel=1
pkgdesc="ANSI terminal color manipulation for Lua"
arch=(any)
url="https://github.com/kikito/ansicolors.lua"
license=('MIT')
depends=(
  "lua"
)
changelog=
source=(https://github.com/kikito/ansicolors.lua/archive/v$pkgver.tar.gz)
md5sums=('f9f9aad26b0e465e25d143bedd68a1e9')

package() {
  cd "$srcdir/ansicolors.lua-$pkgver"
  install -D -m644 "ansicolors.lua" "$pkgdir/usr/lib/lua/5.2/ansicolors/init.lua"
  install -D -m644 "README.textile" "$pkgdir/usr/share/doc/ansicolors/README.textile"
  install -D -m644 "specs/ansicolors_spec.lua" "$pkgdir/usr/share/doc/ansicolors/specs/ansicolors_spec.lua"

}

# vim:set ts=2 sw=2 et:
