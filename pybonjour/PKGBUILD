# Contributor: Ruben Schuller <r.schuller@orgizm.net>

pkgname=pybonjour
pkgver=1.1.1
pkgrel=3
pkgdesc="A pure-Python interface to Apple Bonjour/Avahi"
arch=('any')
provides=('pybonjour')
license=('MIT')
url="http://code.google.com/p/pybonjour/"
depends=('python2')
makedepends=()
source=(http://$pkgname.googlecode.com/files/$pkgname-$pkgver.tar.gz)
md5sums=('30cbfd3e9e9721b39f6aa67df1c315a2')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  python2 setup.py install --root="$pkgdir"
}

