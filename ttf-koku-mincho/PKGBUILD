# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=ttf-koku-mincho
pkgver=1.00
pkgrel=2
pkgdesc="A classical Japanese font - Koku series' Mincho (kokumin)"
url="http://freefonts.jp/font-koku-min.html"
license=('custom')
arch=('any')
depends=('fontconfig' 'xorg-font-utils')
install=ttf.install
source=(http://freefonts.jp/dl_au5hs4w32tqi/ki_kokumin.zip)

package() {
  cd "${srcdir}/ki_kokumin"

  install -d "${pkgdir}/usr/share/fonts/TTF"
  install -m644 *.ttf "${pkgdir}/usr/share/fonts/TTF"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 ipaexfont/IPA_Font_License_Agreement_v1.0.txt "${pkgdir}/usr/share/licenses/${pkgname}/"
}

md5sums=('c7898a2d8fc27ea96bc5bec85e8891da')
