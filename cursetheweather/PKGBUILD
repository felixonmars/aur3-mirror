# Maintainer:  TDY <tdy@archlinux.info>
# Contributor: Dennis Craven <dcraven@gmail.com>
# Contributor: CRT <crt.011@gmail.com>

pkgname=cursetheweather
pkgver=0.6.2
pkgrel=1
pkgdesc="An ncurses client for retrieving weather forecasts"
arch=('any')
url="https://github.com/tdy/ctw/"
license=('GPL')
depends=('ncurses' 'python3')
source=($pkgname-$pkgver.tgz::https://github.com/tdy/ctw/archive/v$pkgver.tar.gz)
sha256sums=('252e693d4957e2e6c0dd1dd6d8f818f7e24819091c17e54def2148e851043d8b')

build() {
  cd "$srcdir/ctw-$pkgver"
  python3 setup.py build
}

package() {
  cd "$srcdir/ctw-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  ln -sf ctw "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
