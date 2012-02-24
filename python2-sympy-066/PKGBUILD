# Maintainer: roughl
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve>  
# Contributor: Peter Garceau <RockyChimp@gmail.com>

pkgname=python2-sympy-066
pkgver=0.6.6
pkgrel=1
arch=('any')
pkgdesc='Symbolic manipulation package (Computer Algebra System), written in pure Python legacy version 0.6.6'
url='http://code.google.com/p/sympy'
license=('BSD')
conflicts=('python-sympy')
provides=('python-sympy')
replaces=('python-sympy')
depends=('python2')
source=("http://sympy.googlecode.com/files/sympy-${pkgver}.tar.gz")

build() {
  cd sympy-${pkgver}

  # python2 fix
  sed \
    -e 's_#!/usr/bin/python_#!/usr/bin/python2_' \
    -i sympy/galgebra/GA.py sympy/galgebra/tests/test_GA.py

  sed \
    -e 's_#!/usr/bin/env python_#!/usr/bin/env python2_' \
    -i sympy/mpmath/tests/runtests.py

  python2 setup.py build
}

package() {
  cd sympy-${pkgver}

  python2 setup.py install --root ${pkgdir} --optimize=1
  rm ${pkgdir}/usr/bin/test

  install -D -m644 LICENSE \
    ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

md5sums=('aa7be690a1df7e7415fe968f5e076733')
