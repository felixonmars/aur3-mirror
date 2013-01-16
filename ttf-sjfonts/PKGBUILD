# Maintainer: TDY <tdy@archlinux.info>

pkgname=ttf-sjfonts
pkgver=2.0.2
pkgrel=1
pkgdesc="Some juicy fonts, Delphine and Steve Hand, created by Steve Jordi with a handwritten feel"
arch=('any')
url="http://sjfonts.sourceforge.net/"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
install=ttf.install
source=(http://downloads.sourceforge.net/sjfonts/sjfonts.$pkgver.tar.bz2)
sha256sums=('f2d15213335a2b3b96f98ccaa5ca69020f4528e45c748aa3444ac5e403e9fa31')

package() {
  cd "$srcdir"
  install -Dm644 Delphine.ttf "$pkgdir/usr/share/fonts/TTF/Delphine.ttf"
  install -Dm644 SteveHand.ttf "$pkgdir/usr/share/fonts/TTF/SteveHand.ttf"
  install -Dm644 README "$pkgdir/usr/share/licenses/$pkgname/license.txt"
}

# vim:set ts=2 sw=2 et:
