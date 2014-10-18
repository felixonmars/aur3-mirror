# Maintainer: Thomas Dziedzic < gostrc at gmail >
# Contributor: Paulo Matias <matiasΘarchlinux-br·org>
# Contributor: Rafael G. Martins <rafael@rafaelmartins.com>

pkgname=python2-mpmath
pkgver=0.19
pkgrel=1
pkgdesc='Python library for arbitrary-precision floating-point arithmetic.'
arch=('any')
url='http://code.google.com/p/mpmath'
license=('BSD')
depends=('python2')
makedepends=('python2-gmpy')
optdepends=('python2-gmpy: speed up computations')
source=("http://mpmath.org/files/mpmath-${pkgver}.tar.gz")
md5sums=('af5cc956b2673b33a25c3e57299bae7b')

build() {
  cd mpmath-${pkgver}

  python2 setup.py build
}

package() {
  cd mpmath-${pkgver}

  python2 setup.py install \
    --root ${pkgdir} \
    --optimize=1

  install -D -m644 LICENSE \
    ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

  # fix mistake during install, upstream problem
  sed -i 's_#!/usr/bin/env python_#!/usr/bin/env python2_' \
    ${pkgdir}/usr/lib/python2.7/site-packages/mpmath/tests/runtests.py
}
