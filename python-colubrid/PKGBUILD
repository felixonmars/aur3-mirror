# Contributor: John Benes <smartcat99s AT gmail>
# Contributor: Lex Black <autumn-wind at web dot de>

pkgname=python-colubrid
pkgver=0.10
pkgrel=3
pkgdesc="A lightweight WSGI publisher"
arch=('i686' 'x86_64')
url="http://wsgiarea.pocoo.org/colubrid/"
license=("BSD")
depends=('python2' 'python2-distribute')
source=(http://wsgiarea.pocoo.org/colubrid/dist/Colubrid-$pkgver.tar.gz)
md5sums=('ce52e81d8971a22064e1418064dcb700')

build() {
  cd $srcdir/Colubrid-$pkgver
  python2 setup.py install --root=$pkgdir
}

