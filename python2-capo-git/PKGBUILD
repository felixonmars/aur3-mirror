_pkgname=capo
pkgname=python2-capo-git
pkgver=r944.15afce3
pkgrel=1
pkgdesc="Calibration and Analysis of PAPER Observations"
arch=('any')
url="https://github.com/dannyjacobs/capo"
license=('GPL')
provides=('python2-capo')
depends=('ipython2'
         'mysql-python'
         'python2-matplotlib'
         'python2-basemap'
         'python2-numpy'
         'python2-scipy'
         'python2-aipy'
         'python2-pyephem'
         'python2-astropy'
         'python2-mpi4py'
         'python2-healpy'
         'python2-atpy'
         'python2-emcee'
         'python2-pyspead-git'
         'python2-sqlalchemy'
         'python2-kapteyn')
optdepends=('python2-astrogrid')
source=('git+https://github.com/dannyjacobs/capo.git')
md5sums=('SKIP')

pkgver() {
    cd $srcdir/$_pkgname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package () {
    cd $srcdir/$_pkgname
    # Remove broken symlinks
    rm ./dcj/scripts/{qstat_to_hostport,sum_integrations,tempgain}.py

    for file in $(find . -name '*.py' -print); do
        sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' $file
        sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
        sed -i 's/pyfits/astropy.io.fits/' $file
    done
    python2 setup.py install --prefix=/usr --root=${pkgdir}
}
