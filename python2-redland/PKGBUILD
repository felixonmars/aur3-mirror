
# Maintainer: Your Name <syamajala AT gmail DOT com>
pkgname=python2-redland
pkgver=1.0.14.1
pkgrel=1
pkgdesc="Python bindings for Redland librdf."
arch=(any)
url="http://librdf.org/bindings/"
license=('LGPL')
depends=('python2' 'redland')
makedepends=('swig')
install=
changelog=
source=($pkgname-$pkgver.tar.gz::http://download.librdf.org/source/redland-bindings-1.0.14.1.tar.gz)
noextract=()
md5sums=('293241365303153d7d0635a76e2dd8d3')
build() {
  cd "$srcdir/redland-bindings-$pkgver"
  ./configure --prefix=/usr --with-python=python2
  make
}

check() {
  cd "$srcdir/redland-bindings-$pkgver"
  make -k check
}

package() {
  cd "$srcdir/redland-bindings-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
