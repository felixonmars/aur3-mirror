#Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
#Contributor: Sebastien Binet <binet@lblbox>
pkgname=python2-h5py
pkgver=2.3.1
pkgrel=1
pkgdesc="General-purpose Python bindings for the HDF5 library"
url="http://www.h5py.org/"
arch=('i686' 'x86_64')
license=('BSD')
depends=('hdf5' 'python2-numpy')
makedepends=('cython2')
conflicts=('hdf5-openmpi' 'python2-h5py-openmpi')
source=(https://pypi.python.org/packages/source/h/h5py/h5py-$pkgver.tar.gz
        DOCS_LICENSE.txt)
md5sums=('8f32f96d653e904d20f9f910c6d9dd91'
         '747a856995bb271af44733b2fdab642b')

build() {
  cd "$srcdir"/h5py-$pkgver

  python2 setup.py build
}

package() {
  cd "$srcdir"/h5py-$pkgver

  python2 setup.py install --prefix=/usr --root="$pkgdir"/ --optimize=1

  install -D "$srcdir/DOCS_LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

