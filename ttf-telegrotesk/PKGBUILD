# Maintainer: Giorgio Gilestro <giorgio@gilest.ro>
# Contributor: Giorgio Gilestro <giorgio@gilest.ro>
pkgname=ttf-telegrotesk
pkgver=1.0
pkgrel=3
depends=('fontconfig' 'xorg-font-utils')
pkgdesc="Tele - Grotesk Font Family"
arch=('any')
source=(https://dl.dropboxusercontent.com/u/52420/AUR/ttf-telegrotesk/ttf-telegrotesk.tar.bz2)
url=http://answers.yahoo.com/question/index?qid=20070630220157AAaxzqU
license=('GPL')
install=$pkgname.install

package() {
  install -d "$pkgdir/usr/share/fonts/TTF"
  cp -dpr --no-preserve=ownership "$srcdir/"*.ttf "$pkgdir/usr/share/fonts/TTF/"
}
md5sums=('6addeb64de607fe44712eb7e2be4f39e')
