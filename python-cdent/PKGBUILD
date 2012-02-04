# $Id$
# Maintainer: Sebastien Binet <binet@lblbox>
pkgname=python-cdent
pkgver=0.5.7
pkgrel=1
pkgdesc="A Portable Module Programming Language"
url="http://www.cdent.org/"
arch=('i686' 'x86_64')
license=('BSD')
depends=('python-yaml')
makedepends=('setuptools')
conflicts=()
replaces=()
backup=()
install=
source=(http://pypi.python.org/packages/source/c/cdent/cdent-$pkgver.tar.gz)
md5sums=('4321f1558916a177619b509c90353da8')

build() {
  cd $startdir/src/cdent-$pkgver
  python setup.py build || return 1
  python setup.py install --optimize=1 --prefix=/usr --root=$pkgdir || return 1
}