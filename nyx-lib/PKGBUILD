# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=nyx-lib
pkgver=2.0.0_rc1
pkgrel=1
pkgdesc="The webOS portability layer"
arch=(i686 x86_64)
url="https://github.com/openwebos/nyx-lib"
license=('APACHE')
depends=('glib2')
makedepends=('cmake')
source=("https://github.com/openwebos/$pkgname/tarball/releases/${pkgver/_/-}.tar.gz")
md5sums=('71a76457db6e8f418453a7fa40cdffa4')

build() {
  cd "$srcdir/openwebos-$pkgname-"*/src
  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/openwebos-$pkgname-"*/src
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
