# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Sebastien Binet <binet@lblbox>
pkgname=python-stream
pkgver=0.8
pkgrel=1
pkgdesc="Lazily-evaluated stream with pipelining via the >> operator"
url="http://pypi.python.org/pypi/stream"
arch=('i686' 'x86_64')
license=('MIT')
depends=('python')
makedepends=()
backup=()
install=
source=(http://pypi.python.org/packages/source/s/stream/stream-$pkgver.tar.gz)
md5sums=('2e173814f4d45115bf438257bca39db6')

build() {
  cd $startdir/src/stream-$pkgver
  python setup.py build || return 1
  python setup.py install --prefix=/usr --root=$startdir/pkg || return 1
}