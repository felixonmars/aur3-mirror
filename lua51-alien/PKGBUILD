# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=lua51-alien
pkgver=0.7.0
pkgrel=1
pkgdesc="Foreign Function Interface (FFI) for Lua 5.1"
arch=('i686' 'x86_64')
url="http://mascarenhas.github.io/alien/"
license=('custom:MIT')
depends=('lua51' 'libffi')
conflicts=('alien')
replaces=('alien')
source=("https://github.com/downloads/mascarenhas/alien/alien-$pkgver.zip")
md5sums=('b1da8e4c0c3fe172559964968362d2a5')

prepare() {
  cd alien-$pkgver

  # use lua 5.1 for constants
  sed -i 's/env lua/&5.1/' src/constants

  # strip luarocks requirement in samples
  sed -i '/luarocks/d' samples/*.lua
}

build() {
  cd alien-$pkgver
  CFLAGS+=" $(pkg-config --cflags libffi lua5.1)" \
  ./configure --prefix=/usr \
              --libdir=/usr/lib/lua/5.1 \
              --datadir=/usr/share/lua/5.1 \
              --docdir=/usr/share/doc/alien-5.1 \
              --with-lua-suffix=5.1
  make
}

package() {
  cd alien-$pkgver
  make DESTDIR="$pkgdir/" install

  # rename constants
  mv "$pkgdir/usr/bin/constants" \
     "$pkgdir/usr/bin/lua51-alien-constants"

  # license
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  tail -n21 doc/alien.md > \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
