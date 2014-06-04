# Maintainer:  <clu>

pkgbase=python2-atpy
pkgname=python2-atpy
_pkgname=ATpy
pkgver=0.9.7
pkgrel=1
pkgdesc="A high-level Python package providing a way to manipulate tables of astronomical data in a uniform way."
url="http://atpy.readthedocs.org/"
arch=('any')
license=('MIT')
makedepends=('python2' 'python2-distribute')
depends=('python2-numpy' 'python2-astropy')
source=(https://pypi.python.org/packages/source/A/${_pkgname}/${_pkgname}-${pkgver}.tar.gz)
md5sums=('2306195fcefff7c1e4d36ae92a894ff2')

package() {
  cd ${srcdir}/$_pkgname-$pkgver
  for file in $(find . -name '*.py' -print); do
    sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' $file
    sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
    sed -i 's/pyfits/astropy.io.fits/' $file
  done
  python2 setup.py install --prefix=/usr --root=${pkgdir} --optimize=1
}

