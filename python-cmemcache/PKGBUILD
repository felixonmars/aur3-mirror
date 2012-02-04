# Contributor: Ryan Coyner <rcoyner@gmail.com>
pkgname=python-cmemcache
pkgver=0.95
pkgrel=3
pkgdesc="Python extension for libmemcache"
arch=('i686' 'x86_64')
url="http://gijsbert.org/cmemcache/"
license=('GPL2')
depends=('libmemcache' 'python')
source=(http://gijsbert.org/downloads/cmemcache/cmemcache-$pkgver.tar.bz2)
md5sums=('b4680c311201ee3c0456e123874a289b')

build() { 
    cd $srcdir/cmemcache-$pkgver
    python setup.py build || return 1
    python setup.py install --root=$pkgdir || return 1
}
