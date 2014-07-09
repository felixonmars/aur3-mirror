# Maintainer: Adam Nelson <nelsonag at umich dot edu>
# Modified from python-h5py-openmpi by Rich Li
pkgname=python2-h5py-openmpi
pkgver=2.3.1
pkgrel=1
pkgdesc="General-purpose Python bindings for the HDF5 library using OpenMPI"
url="http://www.h5py.org"
arch=('i686' 'x86_64')
license=('BSD')
depends=('hdf5-openmpi' 'python2-mpi4py' 'python2-numpy')
makedepends=('cython2')
conflicts=('python2-h5py')
provides=('python2-h5py')
source=(https://github.com/h5py/h5py/archive/"$pkgver".tar.gz)
md5sums=('1a562e038eb242f939ff803937379117')

 
build() {
    cd "$srcdir/h5py-$pkgver"
    export CC=mpicc
    python2 setup.py build --mpi
}

check() {
    cd "$srcdir/h5py-$pkgver"
    export CC=mpicc
    python2 setup.py test --mpi
}
 
package() {
    cd "$srcdir/h5py-$pkgver"
    python2 setup.py install --mpi --prefix=/usr --root="$pkgdir/" --optimize=1
    install -D -m644 licenses/license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
