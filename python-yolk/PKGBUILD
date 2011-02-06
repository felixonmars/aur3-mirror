# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Sebastien Binet <binet@lblbox>
pkgname=python-yolk
pkgver=0.4.1
pkgrel=2
pkgdesc="Yolk is a Python command-line tool and library for obtaining information about packages installed by setuptools, easy_install and distutils (Python 2.5) and for querying PyPI (Python Package Index a.k.a. The Cheese Shop)."
url="http://tools.assembla.com/yolk/"
arch=('any')
license=('GPL2')
depends=('python2')
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=(http://pypi.python.org/packages/source/y/yolk/yolk-${pkgver}.tar.gz)
md5sums=('100b0f20aaf66aacd53987714cc91c3d')

build() {
  cd $startdir/src/yolk-$pkgver
  python2 setup.py build || return 1
  python2 setup.py install --prefix=/usr --root=$startdir/pkg || return 1
}
