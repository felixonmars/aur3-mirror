# Maintainer: Doug Newgard <scimmia22 at outlook dot com>

pkgname=python2-emotion
_pkgname=python-emotion
pkgver=1.7.0
pkgrel=1
pkgdesc="Python2 bindings for Emotion"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('LGPL2.1')
depends=('emotion' 'python2-evas')
makedepends=('cython2')
options=('!libtool' '!emptydirs')
source=("http://download.enlightenment.org/releases/BINDINGS/python/$_pkgname-$pkgver.tar.bz2")
md5sums=('ac7197ce2617a87fad3dd134a98ad01f')

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
