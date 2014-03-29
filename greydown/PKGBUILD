# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=greydown
pkgver=1.0
pkgrel=1
pkgdesc="Gradually greyscale the screen as the battery runs low (compiz only)."
arch=('any')
url="https://github.com/hobarrera/$pkgname"
license=('BSD')
depends=('python-xdg' 'compiz-bzr')
source=("https://github.com/hobarrera/${pkgname}/archive/v${pkgver}.zip")
md5sums=('740f5ccd1d16cc650f71438254c313f5')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="${pkgdir}" install
}
