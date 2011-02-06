# $Id$
# Maintainer: Sebastien Binet <binet@lblbox>
pkgname=python-paragram
pkgver=0.1.2
pkgrel=1
pkgdesc="erlang-style concurrency library for python"
url="http://pypi.python.org/pypi/paragram"
arch=('i686' 'x86_64')
license=('LGPL')
depends=('python2')
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=(http://gfxmonk.net/dist/0install/paragram/paragram-$pkgver.tgz)
md5sums=('4815540023156a5fc707850b2e750533')

build() {
  cd $srcdir
  python2 setup.py build || return 1
  python2 setup.py install --prefix=/usr --root=$pkgdir || return 1
}
