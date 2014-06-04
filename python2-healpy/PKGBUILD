# Old Maintainer: Gero Müller <gero.mueller@physik.rwth-aachen.de>
# Maintainer: Sandro Vitenti <sandro@isoftware.com.br>

_pkgname=healpy
pkgname=python2-${_pkgname}
pkgver=1.7.4
pkgrel=1
arch=('i686' 'x86_64')
license=('LGPL')
pkgdesc="Python package to manipulate healpix maps (using astropy for FITS I/O)"
depends=('python2-numpy' 'python2-matplotlib' 'python2-astropy' 'python2' 'cfitsio')
makedepends=()
url="https://pypi.python.org/pypi/healpy"
md5sums=('bfe12117fe276c05ecf75afe22f1c000')
source=(
	https://pypi.python.org/packages/source/h/healpy/healpy-${pkgver}.tar.gz
)

package() {
  cd $srcdir/${_pkgname}-${pkgver}
  echo -n astropy > ${_pkgname}.egg-info/requires.txt
  sed -i 's/pyfits/astropy/' setup.py
  for file in $(find . -name '*.py' -print); do
    sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' $file
    sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
    sed -i 's/pyfits/astropy.io.fits/' $file
  done
  python2 setup.py install --prefix=/usr --root=${pkgdir}
}
