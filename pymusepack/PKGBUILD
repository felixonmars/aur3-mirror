# Maintainer: Jens Persson <xerxes2 at gmail.com>
pkgname=pymusepack
pkgver=0.4
pkgrel=2
pkgdesc="A python module that interfaces with musepack"
url="http://www.sacredchao.net/quodlibet/wiki/Download"
depends=('python' 'libmpcdec')
source=(http://www.sacredchao.net/~piman/software/pymusepack-0.4.tar.gz)
md5sums=('e534739c46f8b71a147faa600bed9405')

build() {
  cd $startdir/src/$pkgname-$pkgver
  python setup.py install --root=$startdir/pkg/
}
