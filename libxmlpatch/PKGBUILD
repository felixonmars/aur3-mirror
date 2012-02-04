# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=libxmlpatch
pkgver=0.3.3
pkgrel=1
pkgdesc="An XML patch library utilizing libxml2."
arch=(i686 x86_64)
url="http://xmlpatch.sourceforge.net/"
license=('GPL')
depends=('check' 'libxml2' 'glib2')
options=('!libtool')
source=("http://downloads.sourceforge.net/project/xmlpatch/xmlpatch/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('d3bbaad0da834ae98089d7991e50b578')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # newer check support
  sed -i "/_tcase_add_test/s/\(name,\)\( 0, 0, 1\)/\1 0,\2/" tests/check_diff.c

  ./configure --prefix=/usr \
              --enable-static=no
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
