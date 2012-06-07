# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python2-grequests
pkgver=0.1.0
pkgrel=1
_libname=${pkgname/python2-/}
pkgdesc="Allows you to use Requests with Gevent to make asyncronous HTTP Requests easily."
url="http://crate.io/packages/grequests/"
depends=('python2-requests' 'python2-gevent')
makedepends=('python2-distribute')
license=('custom: ISC')
arch=('any')
source=(http://pypi.python.org/packages/source/g/$_libname/$_libname-$pkgver.tar.gz https://github.com/kennethreitz/grequests/raw/master/LICENSE)

build() {
    cd "$srcdir/$_libname-$pkgver"
    python2 setup.py build
}

package() {
    cd "$srcdir/$_libname-$pkgver"
    python2 setup.py install -O1 --root="$pkgdir"
	install -m0644 -D "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

md5sums=('493e63ef6c28d59bc4620cd872f136a0'
         '52d11e5abc76d53b862b5fce68f2bacf')
