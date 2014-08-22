# Maintainer: Alfredo Palhares <masterkorp@masterkorp.net>

pkgname=lua-busted
pkgver=1.11.1
pkgrel=1
pkgdesc="Elegant Lua unit testing"
arch=(any)
url="http://olivinelabs.com/busted/"
license=('MIT')
depends=(
  "lua"
  "lua-cliargs"
  "lua-filesystem"
  "lua-dkjson"
  "lua-say"
  "lua-luassert"
  "lua-ansicolors"
  "lua-penlight"
)
source=(https://github.com/Olivine-Labs/busted/archive/v$pkgver.tar.gz)
md5sums=('a4c7cebb251eabbc678129754e8cddc2')

package() {
  cd "$srcdir/busted-$pkgver"
  mkdir -p "$pkgdir/usr/lib/lua/5.2/busted"
  cp -r "src/"*  "$pkgdir/usr/lib/lua/5.2/busted"

  install -D -m755 "bin/busted" "$pkgdir/usr/bin/busted"
  install -D -m755 "bin/busted_bootstrap" "$pkgdir/usr/bin/busted_bootstrap"
}

# vim:set ts=2 sw=2 et:
