# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=otf-yasashisa-antique
pkgver=3
pkgrel=1
pkgdesc="Japanese antique (gothic + mincho mix) font for comics"
arch=('any')
url="http://www.fontna.com/"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
install=otf.install
source=(http://flop.sakura.ne.jp/font/fontna-op/YasashisaAntiqueFont.zip)

package() {
  cd ${srcdir}/YasashisaAntiqueFont

  install -d "${pkgdir}/usr/share/fonts/OTF"
  install -m644 *.otf "${pkgdir}/usr/share/fonts/OTF/"

  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 IPAexfont00201/IPA_Font_License_Agreement_v1.0.txt \
                mplus-TESTFLIGHT-057/LICENSE_J \
                mplus-TESTFLIGHT-057/LICENSE_E \
                "${pkgdir}/usr/share/licenses/${pkgname}/"
}

md5sums=('30c41bf75096f570caa06803c1c71dfe')
