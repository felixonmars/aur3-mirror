# Maintainer: TDY <tdy@gmx.com>

pkgname=guapdf
pkgver=3.1_DEMO
pkgrel=2
pkgdesc="GUAranteed PDF Decrypter"
arch=('i686')
url="http://www.guapdf.com/"
license=('custom')
depends=('glibc')
source=(http://www.$pkgname.com/download/$pkgname-${pkgver/_/-}.tar.gz
        COPYING)
md5sums=('5eac58c9afa5afae36aaa29d073c4d40'
         '79f923a46aefb4815c86186ddd5a48c8')

build() {
  cd "$srcdir"
  install -Dm755 $pkgname/$pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
