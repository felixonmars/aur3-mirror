# Maintainer: Aaron DeVore <aaron.devore@gmail.com>
# Contributor: Byron Clark <byron@theclarkfamily.name>
# Contributor: Guan 'kuno' Qing <neokuno AT gmail DOT com>

pkgname=python2-couchdb
pkgver=0.9
pkgrel=1
pkgdesc="Python library for working with CouchDB"
url="http://code.google.com/p/couchdb-python/"
license=('BSD')
arch=(any)
depends=('python2>=2.7' 'python2-httplib2' 'couchdb')
makedepends=('python2-distribute')
conflicts=('python-couchdb')
provides=('python-couchdb')
source=(http://pypi.python.org/packages/source/C/CouchDB/CouchDB-$pkgver.tar.gz)
md5sums=('67afd226fed4c641eeb13a9930d334f7')

prepare() {
  cd "$srcdir/CouchDB-$pkgver"
  sed -i 's/python /python2 /' Makefile
}

build() {
  cd "$srcdir/CouchDB-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/CouchDB-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1

  find "$pkgdir" -name "*.py" -exec \
    sed -i '1s|env python|env python2|' {} \;

  install -D -m644 "COPYING" \
    "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}


# vim:ts=2:sw=2:et
