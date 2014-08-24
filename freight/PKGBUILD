# Maintainer: Jochen Schalanda <jochen+aur@schalanda.name>
pkgname=freight
pkgver=0.3.5
pkgrel=1
pkgdesc='A modern take on the Debian archive.'
arch=(any)
url='https://github.com/rcrowley/freight'
license=('BSD')
depends=('gnupg')
source=("https://github.com/rcrowley/freight/archive/v${pkgver}.tar.gz")
sha256sums=('547be6ab023fda97dc2b94be46a285c4327b3ad3336f64f3569a162190cd9d4b')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make prefix='/usr' sysconfdir='/etc' DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
