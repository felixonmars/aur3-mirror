# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Sebastien Binet <binet@lblbox>
pkgname=python-concurrence
pkgver=0.3
pkgrel=2
pkgdesc="Concurrence is a framework for creating massively concurrent network applications in Python"
url="http://opensource.hyves.org/concurrence"
arch=('i686' 'x86_64')
license=('BSD')
depends=('python' 'setuptools' 'pyrex' 'libevent')
makedepends=()
install=
source=(http://concurrence.googlecode.com/files/concurrence-${pkgver}.tar.gz)
md5sums=('0a6b252d1ad73f956d20538e6c2c3edf')

build() {
  cd $startdir/src/concurrence-$pkgver
  python setup.py build || return 1
  python setup.py install --prefix=/usr --root=$startdir/pkg || return 1
}