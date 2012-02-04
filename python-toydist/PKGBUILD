# $Id$
# Maintainer: Sebastien Binet <binet@lblbox>
pkgname=python-toydist
pkgver=0.0.2
pkgrel=1
pkgdesc="A pythonic, no-nonsense packaging tool for python software."
url="http://github.com/cournape/toydist"
arch=('i686' 'x86_64')
license=('BSD')
depends=( 'python')
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=(http://download.github.com/cournape-toydist-6992bde.tar.gz)
md5sums=('b400b9a467b61aebf16564c8568b43b2')

build() {
  cd $startdir/src/cournape-toydist-6992bde
  
  python setup.py build || return 1
  python setup.py install --prefix=/usr --root=$startdir/pkg
}
