#Maintainer: robem <robem at posteo dot de> (based on aur/php-xapian)

pkgname=xapian-lua-bindings
pkgver=1.3.1
pkgrel=1
pkgdesc="Lua bindings for Xapian"
arch=('i686' 'x86_64')
url="http://xapian.org/docs/bindings/lua/"
license=('GPL2')
depends=('xapian-core>='$pkgver 'lua')
source=(http://oligarchy.co.uk/xapian/$pkgver/xapian-bindings-$pkgver.tar.gz)
sha256sums=('5c18ce77b08d2fcc738dadbf85448239d714aad27a0833436e32a82c2ff622c4')

build() {
  cd "$srcdir/xapian-bindings-$pkgver"

  ./configure --prefix=/usr --with-lua LUA_INC=/usr/include XAPIAN_CONFIG=/usr/bin/xapian-config-1.3
  make
}

check() {
  cd "$srcdir/xapian-bindings-$pkgver"

  make -k check
}

package() {
  cd "$srcdir/xapian-bindings-$pkgver"

  make DESTDIR="$pkgdir" install
}

