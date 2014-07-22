_pkgname=aipy
pkgname=python2-aipy-git
pkgver=r384.b8c5315
pkgrel=1
pkgdesc="Astronomical Interferometry in Python"
arch=('any')
url="https://casper.berkeley.edu/astrobaki/index.php/AIPY"
license=('GPL')
provides=('python2-aipy')
conflicts=('python2-aipy')
depends=('python2-numpy>=1.2' 'python2-pyephem>=3.7.2.3' 'python2-astropy')
optdepends=('python2-matplotlib>=0.98' 'python2-basemap>=0.99')
source=('git+https://github.com/AaronParsons/aipy.git')
md5sums=('SKIP')

pkgver() {
    cd $srcdir/$_pkgname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package () {
    cd $srcdir/$_pkgname
    for file in $(find . -name '*.py' -print); do
        sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' $file
        sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
        sed -i 's/pyfits/astropy.io.fits/' $file
    done
    python2 setup.py install --prefix=/usr --root=${pkgdir}

    install -m755 -d "${pkgdir}/usr/share/licenses/python2-aipy"
    install -m644 LICENSE* "${pkgdir}/usr/share/licenses/python2-aipy/"
}
