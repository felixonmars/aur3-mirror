# Maintainer: SpepS <dreamspepser at yahoo dot it>

_pkg=midialsa
pkgname=lua-$_pkg
pkgver=1.06
pkgrel=2
pkgdesc="Lua module for the ALSA library, plus some interface functions."
arch=(i686 x86_64)
url="http://www.pjb.com.au/comp/lua/midialsa.html"
license=('GPL')
depends=('lua-midi')
optdepends=('lua-datadumper: test')
source=("http://www.pjb.com.au/comp/lua/$_pkg-$pkgver.tar.gz")
md5sums=('585fff3aac9b5b5b1a4eff4be3d68eca')

build() {
  cd "$srcdir/$_pkg-$pkgver"

  gcc -c C-$_pkg.c -fPIC
  gcc -shared C-$_pkg.o -o C-$_pkg.so -lasound
}

package() {
  cd "$srcdir/$_pkg-$pkgver"

  # library
  install -Dm755 C-$_pkg.so "$pkgdir/usr/lib/lua/5.1/C-$_pkg.so"
  install -Dm644 $_pkg.lua "$pkgdir/usr/share/lua/5.1/$_pkg.lua"

  # doc
  install -Dm644 doc/$_pkg.html "$pkgdir/usr/share/doc/$pkgname/$_pkg.html"

  # examples
  install -Dm644 test/test_al.lua "$pkgdir/usr/share/$pkgname/examples/test_al.lua"
}

# vim:set ts=2 sw=2 et:
