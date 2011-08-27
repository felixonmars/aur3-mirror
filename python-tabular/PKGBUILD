# Maintainer: Liming Wang <lmwang@gmail.com>
pkgname=python-tabular
pkgver=0.0.8
pkgrel=2
pkgdesc="Tabular data container and associated convenience routines in Python"
url="http://pypi.python.org/pypi/tabular"
arch=('i686' 'x86_64')
license=('MIT')
depends=('python2>=2.5' 'python-numpy>=1.3')
makedepends=()
backup=()
install=
source=(http://pypi.python.org/packages/source/t/tabular/tabular-${pkgver}.tar.gz)
md5sums=('104bd3c35dda0e895f1660d5bd47bb14')

build() {
  cd $startdir/src/tabular-$pkgver
  python setup.py build || return 1
  python setup.py install --prefix=/usr --root=$startdir/pkg || return 1
}
