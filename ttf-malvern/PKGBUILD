# Maintainer: TDY <tdy@archlinux.info>

pkgname=ttf-malvern
pkgver=1.0
pkgrel=4
pkgdesc="A sanserif typeface with rounded stroke ends"
arch=('any')
url="http://www.eurofurence.net/malvern.html"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
install=ttf.install
source=(http://www.eurofurence.net/ma_tt.zip
        http://ftp.gwdg.de/pub/dante/fonts/malvern/0copying.txt)
md5sums=('47d50ea0e358fdbd6113f2da8257b636'
         '814db4de56369ad2b4ca03613572c575')

package() {
  cd "$srcdir"
  install -dm755 "$pkgdir/usr/share/fonts/TTF"
  install -Dm644 ma*.ttf "$pkgdir/usr/share/fonts/TTF"
  install -Dm644 0copying.txt "$pkgdir/usr/share/licenses/$pkgname/copying.txt"
}

# vim:set ts=2 sw=2 et:
