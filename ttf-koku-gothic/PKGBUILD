# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=ttf-koku-gothic
pkgver=1.00
pkgrel=2
pkgdesc="A classical Japanese font - Koku series' Gothic (kokugo)"
url="http://freefonts.jp/font-koku-go.html"
license=('custom')
arch=('any')
depends=('fontconfig' 'xorg-font-utils')
install=ttf.install
source=(http://freefonts.jp/dl_au5hs4w32tqi/ki_kokugo.zip)

package() {
  cd "${srcdir}/ki_kokugo"

  install -d "${pkgdir}/usr/share/fonts/TTF"
  install -m644 *.ttf "${pkgdir}/usr/share/fonts/TTF"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 mplus-TESTFLIGHT-057/LICENSE_E ipaexfont/IPA_Font_License_Agreement_v1.0.txt "${pkgdir}/usr/share/licenses/${pkgname}/"
}

md5sums=('ba33fe1cfb47eccd7b9aa1e6fe61e8f6')
