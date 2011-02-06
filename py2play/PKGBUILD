# Contributor: Alessio Biancalana <dottorblaster@gmail.com>

pkgname=py2play
pkgver=0.1.10
pkgrel=1
pkgdesc="A peer-to-peer network game engine in Python"
url="http://home.gna.org/oomadness/en"
arch=('i686' 'x86_64')
license="GPL"
depends=('python')
source=(http://download.gna.org/slune/Py2Play-$pkgver.tar.gz)
md5sums=('ebf5ad7bd6f683e49d9f323fc8ba3846')

build() {
  cd $startdir/src/Py2Play-$pkgver
  python setup.py install --root=$startdir/pkg
}
