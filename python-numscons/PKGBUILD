# Contributor: Sebastien Binet <binet@cern.ch>
pkgname=python-numscons
pkgver=0.9.3
pkgrel=1
arch=("i686" "x86_64")
pkgdesc="Enable to use scons within distutils to build extensions"
url="http://pypi.python.org/packages/source/n/numscons"
license=("BSD")
depends=('scons')
source=("http://pypi.python.org/packages/source/n/numscons/numscons-${pkgver}.tar.bz2")
md5sums=('489f8a3d377d3d1cc2be8624243c8f36')


build() {
  cd $startdir/src/numscons-${pkgver}
  python setup.py build || return 1
  python setup.py install --prefix=/usr --root=$startdir/pkg

}
