# Maintainer: perlawk
#pyleptonica-0.8.tar.gz
pkgname=python2-pyleptonica
_pkgname=pyleptonica
pkgver=0.8
pkgrel=1
pkgdesc="A python interface to leptonica image processing library"
arch=(any)
url="http://code.google.com/p/pylepthonica/"
license=('GPL')
conflicts=()
provides=()
depends=('python2')
source=(http://pylepthonica.googlecode.com/files/$_pkgname-$pkgver.tar.gz)
md5sums=('e5992577803d7034950920197a3acff2')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
