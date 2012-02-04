# Contributor: Paul Colomiets <pc@gafol.net>

pkgname=pyzza
pkgver=0.2.15
pkgrel=1
pkgdesc="A python-like programming language targeting Flash platform"
arch=(any)
url="http://pyzza.gafol.net"
license=('MIT')
depends=('python')
options=(!emptydirs)
source=(http://github.com/downloads/tailhook/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=("d1a3c9a5e0af2d455551978a7e8f23e6")

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root=$pkgdir/ --optimize=1 || return 1
}
