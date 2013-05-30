# Maintainer: Dennis Fink <the_metalgamer@hackerspace.lu>
# Submitter: mitsuse <mitsuse at gmail>

pkgname=python2-flask-peewee
pkgver=0.6.4
pkgrel=1
pkgdesc="Peewee integration for flask"
arch=(any)
url="http://pypi.python.org/pypi/flask-peewee"
license=("BSD")
depends=('python2' 'python2-flask' 'python2-wtf-peewee')
source=("http://pypi.python.org/packages/source/f/flask-peewee/flask-peewee-$pkgver.tar.gz")
makedepends=('python2-distribute')
md5sums=('c233c63f365886e2bc12b5b70b9db03e')

build() {
  cd $srcdir/flask-peewee-$pkgver
  python2 setup.py build
}

package() {
  cd $srcdir/flask-peewee-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1

  install -D -m644 $srcdir/flask-peewee-$pkgver/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
