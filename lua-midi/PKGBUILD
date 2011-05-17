# Maintainer: SpepS <dreamspepser at yahoo dot it>

_pkg=MIDI
pkgname=lua-midi
pkgver=5.5
pkgrel=2
pkgdesc="Lua module for reading, writing and manipulating MIDI data"
arch=(any)
url="http://www.pjb.com.au/comp/lua/MIDI.html"
license=('GPL')
depends=('lua' 'luaposix')
optdepends=('lua-datadumper: test')
source=("http://www.pjb.com.au/comp/lua/$_pkg-$pkgver.tar.gz")
md5sums=('9dc2628f5302ed9be72fab88e7677b86')

build() {
  return 0
}

package() {
  cd "$srcdir/$_pkg-$pkgver"

  # library
  install -Dm644 $_pkg.lua "$pkgdir/usr/share/lua/5.1/$_pkg.lua"

  # docs and examples
  install -Dm644 doc/$_pkg.html "$pkgdir/usr/share/doc/$pkgname/$_pkg.html"
  install -Dm644 test/test_mi.lua "$pkgdir/usr/share/$pkgname/examples/test_mi.lua"
}

# vim:set ts=2 sw=2 et:
