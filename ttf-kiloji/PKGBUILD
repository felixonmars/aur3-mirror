# Maintainer: TDY <tdy@gmx.com>

pkgname=ttf-kiloji
pkgver=2.1.0
pkgrel=1
pkgdesc="A Japanese TrueType font with a longhand style"
arch=('any')
url="http://www.ez0.net/distribution/font/kiloji/"
license=('BSD')
depends=('fontconfig' 'xorg-font-utils')
install=ttf.install
source=(http://www.ez0.net/wp-content/uploads/distribution/font/kiloji/kiloji_{,p,d,b}$pkgver.zip)
md5sums=('2ac79753ad92cffb6163651f7b01f099'
         '579c91a6a53079f00ee06383d1749096'
         '757ce593282c2b689bca9a3fd0a4bae0'
         '924588fde092b496fae1ac8830bf5610')

build() {
  cd "$srcdir"
  install -dm755 "$pkgdir/usr/share/fonts/TTF"
  install -cm644 *.ttf "$pkgdir/usr/share/fonts/TTF"
  install -Dm644 License.txt "$pkgdir/usr/share/licenses/$pkgname/license.txt"
}
