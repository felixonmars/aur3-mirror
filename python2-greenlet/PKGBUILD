# Contributor: Ralf Schmitt <ralf@systemexit.de>
# Last changed: 2012-02-11 22:03:17 by ralf

pkgname=python2-greenlet
pkgver=0.3.4
pkgrel=1
pkgdesc="python coroutine library"
license=("MIT")
url="http://pypi.python.org/pypi/greenlet"
depends=('python2')
source=(http://pypi.python.org/packages/source/g/greenlet/greenlet-$pkgver.zip)
arch=('i686' 'x86_64')

md5sums=('530a69acebbb0d66eb5abd83523d8272')
sha1sums=('1bff62c43e179d3f4866f31a8258a259c82b4803')

build() {
  cd $startdir/src/greenlet-$pkgver
  /usr/bin/python2 setup.py build || return 1
  /usr/bin/python2 setup.py install --root=$startdir/pkg
}
