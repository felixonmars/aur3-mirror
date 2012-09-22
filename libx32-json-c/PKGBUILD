# Maintainer: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Geoffroy Carrier <geoffroy.carrier@koon.fr>
# Contributor: congyiwu <congyiwu AT gmail DOT com>

_pkgbasename=json-c
pkgname=libx32-$_pkgbasename
pkgver=0.9
pkgrel=2.1
pkgdesc="A JSON implementation in C (x32 ABI)"
url="http://oss.metaparadigm.com/json-c/"
license=("MIT")
arch=('x86_64')
depends=('libx32-glibc' $_pkgbasename)
makedepends=('gcc-multilib-x32' 'libtool-multilib')
source=(http://oss.metaparadigm.com/$_pkgbasename/$_pkgbasename-$pkgver.tar.gz)
md5sums=('3a13d264528dcbaf3931b0cede24abae')
options=(!libtool)
build() {
  cd "$srcdir/$_pkgbasename-$pkgver"

  export CC="gcc -mx32"
  export PKG_CONFIG_PATH="/usr/libx32/pkgconfig"

  ./configure --prefix=/usr --libdir=/usr/libx32
  make
}

package() {
  cd "$srcdir/$_pkgbasename-$pkgver"
  make DESTDIR="$pkgdir" install

  rm -r "$pkgdir/usr/include"

  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s $_pkgbasename "$pkgdir/usr/share/licenses/$pkgname"
}
