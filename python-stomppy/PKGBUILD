# Maintainer: Kevin Whitaker <eyecreate at gmail dot com>

pkgname=python-stomppy
pkgver=3.0.2
pkgrel=1
pkgdesc="Advanced STOMP client for Python 2 and 3"
arch=(any)
url="http://code.google.com/p/stomppy"
license=(Apache 2.0)
depends=(python)
makedepends=(python)
source=(http://stomppy.googlecode.com/files/stomp.py-$pkgver.tar.gz)

build() {
     cd $srcdir/stomp.py-$pkgver
     python setup.py install --root=$pkgdir
}

md5sums=('ae66302d04ff2607d737c5c154c1a5b3')
 
