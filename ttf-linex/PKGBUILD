# Maintainer: TDY <tdy@gmx.com>

pkgname=ttf-linex
pkgver=2.2
pkgrel=3
pkgdesc="A handwriting font pack suitable for educational and institutional use"
arch=('any')
url="http://gata.linex.org/trac/browser/ttf-linex/"
license=('GPL')
depends=('fontconfig' 'xorg-font-utils')
install=ttf.install
source=(http://ftp.debian.org/debian/pool/main/t/$pkgname/${pkgname}_$pkgver.orig.tar.gz)
md5sums=('3c2a792b5deccfc1f37e68ed410de756')

build() {
  cd "$srcdir/$pkgname-$pkgver.orig"
  install -dm755 "$pkgdir/usr/share/fonts/TTF"
  install -cm644 *.ttf "$pkgdir/usr/share/fonts/TTF"
}
