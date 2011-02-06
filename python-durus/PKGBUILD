# Contributor: Richard Murri <admin@richardmurri.com>

pkgname=python-durus
pkgver=3.9
pkgrel=1
pkgdesc="a persistent object system for applications written in the Python programming language"
arch=(any)
url="http://www.mems-exchange.org/software/durus/"
license=(custom)
depends=('python')
makedepends=()
options=(!emptydirs)
source=(http://www.mems-exchange.org/software/durus/Durus-${pkgver}.tar.gz)
md5sums=('a432b65bc9fdc24f80f768022d9a3c04')

build() {
  cd "$srcdir/Durus-$pkgver"
  python setup.py install --root=$pkgdir/ || return 1

  # Remember to install licenses if the license is not a common license!
  install -D -m644 LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

