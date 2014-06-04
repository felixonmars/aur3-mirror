pkgname=python2-aipy
pkgver=1.1.1
pkgrel=2
pkgdesc="Astronomical Interferometry in Python"
arch=('any')
url="https://casper.berkeley.edu/astrobaki/index.php/AIPY"
license=('GPL')
depends=('python2-numpy>=1.2' 'python2-pyephem>=3.7.2.3' 'python2-astropy')
optdepends=('python2-matplotlib>=0.98' 'python2-basemap>=0.99')
source=(http://pypi.python.org/packages/source/a/aipy/aipy-${pkgver}.tar.gz)
md5sums=('2822256b3617aaf50bad5141fcdd64fc')

package () {
    cd $srcdir/aipy-${pkgver}
    for file in $(find . -name '*.py' -print); do
        sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' $file
        sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
        sed -i 's/pyfits/astropy.io.fits/' $file
    done
    python2 setup.py install --prefix=/usr --root=${pkgdir}

    install -m755 -d "${pkgdir}/usr/share/licenses/python2-aipy"
    install -m644 LICENSE* "${pkgdir}/usr/share/licenses/python2-aipy/"
}
