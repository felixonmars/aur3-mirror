# Maintainer: Alexander Duscheleit <jinks@archlinux.us>
# Based on flameeyes' instructions and ebuild (http://blog.flameeyes.eu/2011/01/17/microupdates-for-microcodes)
pkgname=amd-ucode
pkgver=2011.01.11
_pkgver=${pkgver//./-}
pkgrel=2
pkgdesc="AMD Family 10h, 11h and 14h microcode patch data"
arch=('any')
url="http://www.amd64.org/support/microcode.html"
license=('custom')
depends=('linux')
install=amd-ucode.install
source=(http://www.amd64.org/pub/microcode/$pkgname-$_pkgver.tar)
sha256sums=('60c42629f3c91f97a350bc6a3ad0a256f7b794bfab1f143d7f1924a70728f4ec')

package() {
  cd "$srcdir/$pkgname-$_pkgver"

  install -D -m644 microcode_amd.bin "$pkgdir/lib/firmware/amd-ucode/microcode_amd.bin"
  install -D -m644 README "$pkgdir/usr/share/licenses/amd-ucode/LICENSE"
}

# vim:set ts=2 sw=2 et:
