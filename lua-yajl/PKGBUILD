# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=lua-yajl
pkgver=2.0
pkgrel=1
pkgdesc="Integrate the yajl JSON library with Lua."
arch=(i686 x86_64)
url="https://github.com/brimworks/lua-yajl"
license=('GPL')
depends=('lua' 'yajl')
makedepends=('cmake')
conflicts=("$pkgname-git")
source=("https://github.com/brimworks/$pkgname/tarball/v$pkgver")
md5sums=('27e62693520079ef45e195dc42223d79')

build() {
  cd "$srcdir"/brimworks*

  # fix test.lua
  sed -e "/_dir/d" \
      -e "2apackage.path = \"/usr/share/$pkgname/examples/?.lua;\" .. package.path" \
      -i test.lua

  [ -d build ] || mkdir build && cd build  
  cmake ..
  make
}

package() {
  cd "$srcdir"/brimworks*

  # library
  install -Dm755 build/yajl.so "$pkgdir/usr/lib/lua/5.1/yajl.so"

  # examples
  install -d "$pkgdir/usr/share/$pkgname/examples"
  install -Dm644 *.lua "$pkgdir/usr/share/$pkgname/examples"
}

# vim:set ts=2 sw=2 et:
