# Maintainer: Hilton Medeiros <medeiros.hilton@gmail.com>

pkgname=credis
pkgver=0.2.3
pkgrel=1
pkgdesc="A client library in plain C for communicating with Redis servers."
arch=('i686' 'x86_64')
url="http://credis.googlecode.com/"
license=('BSD')
depends=('glibc')
source=(http://credis.googlecode.com/files/$pkgname-$pkgver.tar.gz)
md5sums=('338c21667ece272d9ab669738e27b191')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -d "$pkgdir"/usr/{lib,include}
  install -m755 libcredis.so "$pkgdir/usr/lib"
  install -m644 libcredis.a "$pkgdir/usr/lib"
  install -m644 *.h "$pkgdir/usr/include"
}
