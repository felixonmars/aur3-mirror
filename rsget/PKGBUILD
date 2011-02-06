# Maintainer: 3ED <krzysztof1987@gmail.com>
pkgname=rsget
pkgver=0.3.1
pkgrel=1
pkgdesc="RapidShareGET - rapidshare files downloader"
arch=('any')
url="http://csk.pl/~kas/?n=Scripts.Rsget"
license=('GPL')
optdepends=("trickle: bandwidth limiter")
source=(http://csk.pl/~kas/dl/rsget/$pkgname-$pkgver.tar.gz)
sha256sums=('696ae932cfab4d682243d37594d46d9561d8d5233a8d6091f0e36f073c523709')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make clean || return 1
  make locales || return 1
}
package() {
  cd "$srcdir/$pkgname-$pkgver"
  DESTDIR="${pkgdir}" make install || return 1
}
