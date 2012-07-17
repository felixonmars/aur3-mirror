# Contributor: Patrick Schneider <Patrick.Schneider@uni-ulm.de>
# Maintainer: Christian Lask <mail - at - elfsechsundzwanzig.de>
pkgname=typo3
pkgver=4.7.2
pkgrel=1
pkgdesc="Flexible web content management system"
arch=('any')
url="http://typo3.org"
license=('GPL')
depends=(php)
optdepends=('mysql: database system supported by the TYPO3 DBAL.'
                    'postgresql: another database system supported by the TYPO3 DBAL.')
options=(!strip !docs)
install=$pkgname.install
source=(http://prdownloads.sourceforge.net/$pkgname/${pkgname}_src-$pkgver.tar.gz $pkgname.install)
md5sums=('a71434de279a6ba52d4e8beeaa4353c8'
         '8376492c32e83d07b6c1a3c3bc4116f3')
build() {
  mkdir -p "$pkgdir/srv/http"
  cp -pR "$srcdir/${pkgname}_src-$pkgver" "$pkgdir/srv/http/${pkgname}_src"
}
