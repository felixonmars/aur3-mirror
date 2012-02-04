# Maintainer: SpepS <dreamspepser at yahoo dot it>
# Contributor: Pierre Chapuis <catwell at archlinux dot us>

pkgname=pyliblo
pkgver=0.9.1
pkgrel=1
pkgdesc='Python wrapper for the liblo OSC library'
arch=('i686' 'x86_64')
url='http://das.nasophon.de/pyliblo/'
license=('GPL')
depends=('python2' 'liblo>=0.26')
makedepends=('cython')
provides=('python2-liblo')
conflicts=('python2-liblo')
source=("http://das.nasophon.de/download/$pkgname-$pkgver.tar.gz")
md5sums=('eb2b2b86031b702eba8e65da75fbaacc')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  export PYTHON="python2"
  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  python2 setup.py install --prefix=/usr --root="$pkgdir"
}