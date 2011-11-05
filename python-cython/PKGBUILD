# Maintainer: Kringel
# This PKGBUILD is just a python 3 version of community/cython in ABS

pkgname=python-cython
pkgver=0.15.1
pkgrel=2
pkgdesc="C-Extensions for Python"
arch=(i686 x86_64)
url="http://www.cython.org"
license=('APACHE')
depends=('python')
source=("http://cython.org/release/Cython-$pkgver.tar.gz")
md5sums=('171021b3845c9ca8bd6d8185b3cde664')

build() {
  cd $srcdir/Cython-$pkgver
  python setup.py install --root=$pkgdir
  mv $pkgdir/usr/bin/{,python-}cygdb
  mv $pkgdir/usr/bin/{,python-}cython
}
