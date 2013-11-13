# Maintainer: jtts
# Contributor: josephgbr <rafael.f.f1@gmail.com>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>

_pkgbasename=db
pkgname=lib32-$_pkgbasename
pkgver=5.3.28
pkgrel=2
pkgdesc="The Berkeley DB embedded database system (32-bit)"
arch=(x86_64)
url="http://www.oracle.com/technology/software/products/berkeley-db/index.html"
license=(custom)
depends=(lib32-gcc-libs sh $_pkgbasename)
makedepends=(gcc-multilib)
#options=(libtool staticlibs)
source=(http://download.oracle.com/berkeley-db/db-$pkgver.tar.gz)
sha1sums=('fa3f8a41ad5101f43d08bc0efb6241c9b6fc1ae9')

build() {

  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd "${srcdir}"/$_pkgbasename-$pkgver/build_unix
  ../dist/configure --prefix=/usr --enable-compat185 \
    --enable-shared --enable-static --enable-cxx \
    --enable-dbm --libdir=/usr/lib32
  make LIBSO_LIBS=-lpthread
}

package() {
  cd "${srcdir}"/$_pkgbasename-$pkgver/build_unix
  make DESTDIR="${pkgdir}" install
  rm -r "${pkgdir}"/usr/{docs,include,bin}
  mkdir -p "${pkgdir}"/usr/share/licenses
  ln -s $_pkgbasename "${pkgdir}"/usr/share/licenses/$pkgname
}
