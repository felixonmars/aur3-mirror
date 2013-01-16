# Maintainer: TDY <tdy@archlinux.info>

pkgname=yawho
pkgver=1.2
pkgrel=1
pkgdesc="yet another who implementation"
arch=('i686' 'x86_64')
url="http://wizard.ae.krakow.pl/~mike/#yawho"
license=('GPL')
depends=('glibc')
source=(http://wizard.ae.krakow.pl/~mike/download/$pkgname-$pkgver.tar.gz)
md5sums=('cce11c0d56678d4ae2c38cba4fb94402')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
