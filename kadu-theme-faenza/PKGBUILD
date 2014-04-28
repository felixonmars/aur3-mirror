# Installation script for Faenza theme for Kadu
# Author: FadeMind
pkgname=kadu-theme-faenza
pkgver=1.0.0
pkgrel=1
pkgdesc="Faenza theme for Kadu"
arch=('any')
url="http://kadu.im"
license=('CCPL')
depends=('kadu')
source=("$pkgname-$pkgver.tar.gz::https://copy.com/zmeWwip8hqJ7/kadu-theme-faenza.tar.gz?download=1")
md5sums=('5a2d452678aa42674623a14d35e4f2e4')

package() {
   cd $startdir/src/faenza
   install -dm755  $pkgdir/usr/share/kadu/themes/icons/faenza/
   cp -rf  * $pkgdir/usr/share/kadu/themes/icons/faenza/
}