# Maintainer: Ivan Pulido < ijpulidos at riseup.net >
# Contributor: Esteban V. Carnevale < alfplayer0 at gmail >

pkgname=python-mpmath
pkgver=0.19
pkgrel=1
pkgdesc='Python library for arbitrary-precision floating-point arithmetic. Python 3.x version.'
arch=('any')
url='http://mpmath.org/'
license=('BSD')
depends=('python')
makedepends=('python-gmpy')
optdepends=('python-gmpy: speed up computations')
source=("http://mpmath.org/files/mpmath-${pkgver}.tar.gz")
md5sums=('af5cc956b2673b33a25c3e57299bae7b')

build() {
  cd mpmath-${pkgver}

  # Stops Syntax Error message when building for python 3.
  #rm mpmath/libmp/exec_py2.py

  python setup.py build
}

package() {
  cd mpmath-${pkgver}

  python setup.py install \
    --root ${pkgdir} \
    --optimize=1

  install -D -m644 LICENSE \
    ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

}
