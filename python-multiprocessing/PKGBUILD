# Contributor: Sebastien Binet (binet@cern.ch)

pkgname=python-multiprocessing
pkgver=2.6.2.1
pkgrel=1
pkgdesc="Package for using processes which mimics the threading module (backported from python-2.6)"
url="http://code.google.com/p/python-multiprocessing"
arch=('i686' 'x86_64')
license=("BSD")
depends=('python')
provides=('python-multiprocessing')
conflicts=('python-multiprocessing')
source=(http://pypi.python.org/packages/source/m/multiprocessing/multiprocessing-${pkgver}.tar.gz)
md5sums=('5cc484396c040102116ccc2355379c72')

build() {
  cd $startdir/src/multiprocessing-${pkgver}
  python setup.py install --prefix=/usr --root=$startdir/pkg || return 1
}
