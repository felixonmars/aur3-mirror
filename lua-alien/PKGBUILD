# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=lua-alien
pkgver=0.7.0
pkgrel=1
pkgdesc="Foreign Function Interface (FFI) for Lua"
arch=('i686' 'x86_64')
url="http://mascarenhas.github.io/alien/"
license=('custom:MIT')
depends=('lua' 'libffi')
conflicts=('alien')
replaces=('alien')
source=("https://github.com/downloads/mascarenhas/alien/alien-$pkgver.zip")
md5sums=('b1da8e4c0c3fe172559964968362d2a5')

prepare() {
  cd alien-$pkgver

  # strip luarocks requirement in samples
  sed -i '/luarocks/d' samples/*.lua
}

build() {
  cd alien-$pkgver
  CFLAGS+=" $(pkg-config --cflags libffi)" \
  ./configure --prefix=/usr \
              --libdir=/usr/lib/lua/5.2 \
              --datadir=/usr/share/lua/5.2
  make
}

package() {
  cd alien-$pkgver
  make DESTDIR="$pkgdir/" install

  # rename constants
  mv "$pkgdir/usr/bin/constants" \
     "$pkgdir/usr/bin/lua-alien-constants"

  # license
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  tail -n21 doc/alien.md > \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
