# Maintainer: eagletmt <eagletmt@gmail.com>
pkgname=xbyak
pkgver=4.70
pkgrel=1
pkgdesc='x86, x64 JIT assembler'
arch=('any')
url='http://homepage1.nifty.com/herumi/soft/xbyak_e.html'
depends=()
license=('BSD')
source=("$pkgname-$pkgver.tar.gz::https://github.com/herumi/xbyak/archive/v$pkgver.tar.gz")

build() {
  :
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX="$pkgdir/usr" install
  install -Dm644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/COPYRIGHT"
}

# vim:set ts=2 sw=2 et:
sha1sums=('a56246e87df6c0e9f750eff0b34f8dc2d26ac5cc')
