# Maintainer: Doug Newgard <scimmia22 at outlook dot com>

pkgname=python2-ecore
_pkgname=python-ecore
pkgver=1.7.0
pkgrel=1
pkgdesc="Python2 bindings for Ecore"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('LGPL2.1')
depends=('ecore' 'python2-evas')
makedepends=('cython2')
options=('!libtool' '!emptydirs')
source=("http://download.enlightenment.org/releases/BINDINGS/python/$_pkgname-$pkgver.tar.bz2")
md5sums=('15dd908b71d09ef30f7e758739f3b6fd')

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
