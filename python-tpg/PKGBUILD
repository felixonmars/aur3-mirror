# Maintainer palbo <palbof@gmail.com>
pkgname=python-tpg
pkgver=3.1.2
pkgrel=1
pkgdesc="Toy Parser Generator is a lexical and syntactic parser generator for Python"
arch=('i686' 'x86_64')
url="http://christophe.delord.free.fr/tpg/"
license=('LGPL')
depends=('python')
source=(http://christophe.delord.free.fr/tpg/download/TPG-$pkgver.tar.gz)
md5sums=('6db93d06bba42dd8200098a6ea4365e5')

build() {
  cd $startdir/src/TPG-$pkgver
  python setup.py install --root=$startdir/pkg || return 1
}
