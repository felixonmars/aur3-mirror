# Maintainer: xF0E droidlove@ya.ru>

pkgname=python-ete
_pkgname=ete2
pkgver=2.2
_rev=1072
pkgrel=1
pkgdesc="A python Environment for Tree Exploration"
arch=('i686' 'x86_64')
url="https://pypi.python.org/packages/source/e/ete2"
license=('GPL3')
makedepends=('python2' 'python2-numpy' 'python2-pyqt' 'python2-scipy' 'mysql-python' 'python-lxml')
source=($url/${_pkgname}-${pkgver}.${_rev}.tar.gz)
md5sums=('2864ed149ac22afbc533199c9f8cb133')

build() {
  cd $srcdir/${_pkgname}-${pkgver}.${_rev}
  python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
