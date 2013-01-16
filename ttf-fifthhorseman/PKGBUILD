# Maintainer: TDY <tdy@archlinux.info>

pkgname=ttf-fifthhorseman
pkgver=0.13
pkgrel=1
pkgdesc="A TrueType font based on the handwriting of Daniel Kahn Gillmor (DKG)"
arch=('any')
url="http://cmrg.fifthhorseman.net/wiki/fonts/"
license=('GPL3' 'custom:OFL')
depends=('fontconfig' 'xorg-font-utils')
makedepends=('fontforge')
install=ttf.install
source=(http://cmrg.fifthhorseman.net/debian/pool/fonts/t/$pkgname-dkg-handwriting/$pkgname-dkg-handwriting_$pkgver.orig.tar.gz)
md5sums=('3877e181c786990572cd9043c30a4a67')

build() {
  cd "$srcdir/$pkgname-dkg-handwriting-$pkgver"
  ./dkg-handwriting.pe 2> /dev/null
}

package() {
  cd "$srcdir/$pkgname-dkg-handwriting-$pkgver"
  install -Dm644 dkg.ttf "$pkgdir/usr/share/fonts/TTF/dkg.ttf"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
