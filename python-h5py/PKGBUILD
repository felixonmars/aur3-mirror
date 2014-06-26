# Maintainer: Rich Li <rich@dranek.com>
pkgname=python-h5py
pkgver=2.3.1
pkgrel=1
pkgdesc="General-purpose Python bindings for the HDF5 library"
url="http://www.h5py.org"
arch=('i686' 'x86_64')
license=('BSD')
depends=('hdf5' 'python-numpy')
makedepends=('cython')
conflicts=('python-h5py-openmpi')
provides=('python-h5py')
# As of 2014-06-25 the tarball is not yet on Github, so falling back to PyPI url
#source=(https://github.com/h5py/h5py/archive/"$pkgver".tar.gz)
source=(https://pypi.python.org/packages/source/h/h5py/h5py-$pkgver.tar.gz)
md5sums=('8f32f96d653e904d20f9f910c6d9dd91')

# Getting build errors complaining about MPI and you have hdf5-openmpi installed? Use python-h5py-openmpi instead.
 
build() {
    cd "$srcdir/h5py-$pkgver"
    python setup.py build
}

check() {
    cd "$srcdir/h5py-$pkgver"
    python setup.py test
}
 
package() {
    cd "$srcdir/h5py-$pkgver"
    python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
    install -D -m644 licenses/license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
