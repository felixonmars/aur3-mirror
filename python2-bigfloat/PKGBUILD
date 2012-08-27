# Maintainer: Felix Yan <felixonmars@gmail.com>

_pkgbase=bigfloat
pkgname=python2-${_pkgbase}
pkgver=0.3.0a2
pkgrel=1
pkgdesc="Arbitrary-precision correctly-rounded floating point arithmetic in Python, via the MPFR library."
arch=('any')
url="http://packages.python.org/bigfloat/"
license=('LGPL')
depends=('python2' 'gmp' 'mpfr')
noextract=()
source=("http://pypi.python.org/packages/source/b/${_pkgbase}/${_pkgbase}-${pkgver}.tar.gz")
md5sums=('d4384ec7aea0f8228185c9ea86c83f9a')

build() {
  :
}

package() {
  cd "$srcdir/$_pkgbase-$pkgver"

  python2 setup.py install \
    --prefix=/usr \
    --root="$pkgdir"
}

