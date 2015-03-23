# Maintainer: Francois Garillot <francois[at]garillot.net>
# Contributor:  Massimiliano Torromeo <massimiliano.torromeo[@]gmail.com>
pkgname=demjson
pkgver=2.2.3
pkgrel=1
pkgdesc="Encoder, decoder, and lint/validator for JSON (JavaScript Object Notation) compliant with RFC 4627"
arch=(any)
url="http://deron.meranda.us/python/demjson/"
license=('LGPL')
depends=(python2)
makedepends=(python2-distribute)
md5sums=('6e0cba366f6697f51f08263516dcb4b0')
source=(http://deron.meranda.us/python/$pkgname/dist/$pkgname-$pkgver.tar.gz)

build() {
        cd $srcdir/$pkgname-$pkgver
        python2 setup.py build || return 1
}

package() {
        cd $srcdir/$pkgname-$pkgver
        python2 setup.py install --root=$pkgdir --prefix=/usr || return 1
}

# vim:set ts=2 sw=2 et:
