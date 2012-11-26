# Maintainer: Doug Newgard <scimmia22 at outlook dot com>

pkgname=python2-edje
_pkgname=python-edje
pkgver=1.7.0
pkgrel=1
pkgdesc="Python2 bindings for Edje"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('LGPL2.1')
depends=('edje' 'python2-evas')
makedepends=('cython2')
options=('!libtool' '!emptydirs')
source=("http://download.enlightenment.org/releases/BINDINGS/python/$_pkgname-$pkgver.tar.bz2")
md5sums=('1e0d7a4a4504298caaad0cee476e4edb')

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
