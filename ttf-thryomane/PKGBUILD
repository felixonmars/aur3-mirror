# Maintainer: michelin <linuxisfun0104@gmail.com>
pkgname=ttf-thryomane
pkgver=1.2
pkgrel=1
pkgdesc="A symbol font including Roman-alphabet, Greek, Cyrillic chatacters and IPA(international phonetic alphabet)"
arch=('i686' 'x86_64')
url="http://www.io.com/~hmiller/lang/"
license=('GPL2')
depends=('fontconfig' 'xorg-font-utils')
install=ttf.install
source=(ftp://ftp.io.com/pub/usr/hmiller/fonts/Thryomanes12.zip)
md5sums=('3de96d532e36c201a26060539d03d42e')

build() {
  cd "$srcdir"
  unzip -o Thryomanes12.zip
  install -Dm644 THRYB___.TTF "$pkgdir/usr/share/fonts/TTF/thryb.ttf"
  install -Dm644 THRYBI__.TTF "$pkgdir/usr/share/fonts/TTF/thrybi.ttf"
  install -Dm644 THRYI___.TTF "$pkgdir/usr/share/fonts/TTF/thryi.ttf"
  install -Dm644 THRYRG__.TTF "$pkgdir/usr/share/fonts/TTF/thryrg.ttf"
}
