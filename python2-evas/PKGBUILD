# Maintainer: Doug Newgard <scimmia22 at outlook dot com>

pkgname=python2-evas
_pkgname=python-evas
pkgver=1.7.0
pkgrel=1
pkgdesc="Python2 bindings for Evas"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('LGPL2.1')
depends=('evas' 'python2')
makedepends=('cython2')
options=('!libtool' '!emptydirs')
source=("http://download.enlightenment.org/releases/BINDINGS/python/$_pkgname-$pkgver.tar.bz2")
md5sums=('c3fda2025171f5e3d2bc224e8bae88e5')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  PYTHON=/usr/bin/python2 \
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
