# Maintainer : SpepS <dreamspepser at yahoo dot it>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Lucas Hermann Negri <kkndrox@gmail.com>

pkgname=bitlib
pkgver=26
pkgrel=1
pkgdesc="A tiny library for bitwise operations"
arch=('i686' 'x86_64')
url="http://luaforge.net/projects/bitlib/"
license=('MIT')
depends=('lua')
options=('!libtool')
source=("http://luaforge.net/frs/download.php/4231/$pkgname-$pkgver.tar.gz"
        "COPYING")
md5sums=('b76cb74aef951250f8fa7a65f39bb3d8'
         'f2226f55d3edb52a024402c08e1d2b8b')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr \
              --enable-static=no
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install

  # license
  install -Dm644 ../COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
