# Maintainer: Doug Newgard <scimmia22 at outlook dot com>

pkgname=python2-elementary
_pkgname=python-elementary
pkgver=1.7.0
pkgrel=1
pkgdesc="Python2 bindings for Elementary"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('LGPL2.1')
depends=('elementary' 'python2-evas')
makedepends=('cython2')
options=('!libtool' '!emptydirs')
source=("http://download.enlightenment.org/releases/BINDINGS/python/$_pkgname-$pkgver.tar.bz2")
md5sums=('38c8b2ac508ab4e1d12f1557a12169c9')

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
