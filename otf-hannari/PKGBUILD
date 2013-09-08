# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=otf-hannari
pkgver=1
pkgrel=2
pkgdesc="Japanese softly font (Mincho-style) based on IPA Font v3"
arch=('any')
url="http://typingart.net/"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
install=otf.install
source=(http://typingart.net/font/hannari.zip)

package() {
  cd ${srcdir}/

  install -d "${pkgdir}/usr/share/fonts/OTF"
  install -m644 *.otf "${pkgdir}/usr/share/fonts/OTF/"

  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 IPA_Font_License_Agreement_v1.0.txt \
                read_me.txt \
                "${pkgdir}/usr/share/licenses/${pkgname}/"
}

md5sums=('77b42a9edf5c43e3968f1d6ac87bfea7')
