# Contributor: Nathan Owe. <ndowens04 at gmail>

pkgname=python-freebase
pkgver=0.5
pkgrel=1
pkgdesc="Client for the freebase.com service"
arch=('any')
url="http://code.google.com/p/freebase-python/"
source=(http://freebase-python.googlecode.com/files/freebase-$pkgver.tar.gz)
license=('BSD')
md5sums=('be94a27d92561b981eb52252c4a8d4de')
depends=('python')
options=('!emptydirs')

build() {
  cd $srcdir/freebase-$pkgver
  python setup.py install --root=$pkgdir/
   install -D -m644 PKG-INFO $pkgdir/usr/share/licenses/$pkgname/PKG-INFO
}


