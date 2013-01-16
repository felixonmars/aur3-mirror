# Maintainer: TDY <tdy@archlinux.info>

pkgname=ttf-pagebox
pkgver=1.0
pkgrel=3
pkgdesc="A symbol font for page enumeration, page references, formula numbers, etc"
arch=('any')
url="http://www.eurofurence.net/pagebox.html"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
install=ttf.install
source=(http://www.eurofurence.net/pagebxtt.zip)
md5sums=('3d2f87ee43aa41fc33a240fa8f7537bd')

package() {
  cd "$srcdir"
  install -Dm644 pagebox.ttf "$pkgdir/usr/share/fonts/TTF/pagebox.ttf"
  install -Dm644 pagebxtt.txt "$pkgdir/usr/share/licenses/$pkgname/license.txt"
}

# vim:set ts=2 sw=2 et:
