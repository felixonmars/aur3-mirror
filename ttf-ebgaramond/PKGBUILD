# Contributor: Christoph Glaubitz <chris at chrigl dot de>
# Contributor: Bill Sun <cap.sensitive@gmail.com>

pkgname=ttf-ebgaramond
pkgver=0.016
pkgrel=1
pkgdesc="EB Garamond is an open source project to create a revival of Claude Garamont’s famous humanist typeface from the mid-16th century"
arch=('any')
url="http://www.georgduffner.at/ebgaramond/"
license=('custom:OFL')
depends=('fontconfig' 'xorg-font-utils')
conflicts=('otf-ebgaramond')
source=("https://bitbucket.org/georgd/eb-garamond/downloads/EBGaramond-${pkgver}.zip"
	'OFL.txt')
install=${pkgname}.install

package() {
  install -Dm644 ${srcdir}/EBGaramond-${pkgver}/ttf/EBGaramond08-Italic.ttf ${pkgdir}/usr/share/fonts/TTF/EBGaramond08-Italic.ttf
  install -Dm644 ${srcdir}/EBGaramond-${pkgver}/ttf/EBGaramond08-Regular.ttf ${pkgdir}/usr/share/fonts/TTF/EBGaramond08-Regular.ttf
  install -Dm644 ${srcdir}/EBGaramond-${pkgver}/ttf/EBGaramond08-SC.ttf ${pkgdir}/usr/share/fonts/TTF/EBGaramond08-SC.ttf
  install -Dm644 ${srcdir}/EBGaramond-${pkgver}/ttf/EBGaramond12-Italic.ttf ${pkgdir}/usr/share/fonts/TTF/EBGaramond12-Italic.ttf
  install -Dm644 ${srcdir}/EBGaramond-${pkgver}/ttf/EBGaramond12-AllSC.ttf ${pkgdir}/usr/share/fonts/TTF/EBGaramond12-AllSC.ttf
  install -Dm644 ${srcdir}/EBGaramond-${pkgver}/ttf/EBGaramond12-Regular.ttf ${pkgdir}/usr/share/fonts/TTF/EBGaramond12-Regular.ttf
  install -Dm644 ${srcdir}/EBGaramond-${pkgver}/ttf/EBGaramond12-SC.ttf ${pkgdir}/usr/share/fonts/TTF/EBGaramond12-SC.ttf
  install -Dm644 ${srcdir}/EBGaramond-${pkgver}/ttf/EBGaramond-InitialsF1.ttf ${pkgdir}/usr/share/fonts/TTF/EBGaramond-InitialsF1.ttf
  install -Dm644 ${srcdir}/EBGaramond-${pkgver}/ttf/EBGaramond-InitialsF2.ttf ${pkgdir}/usr/share/fonts/TTF/EBGaramond-InitialsF2.ttf
  install -Dm644 ${srcdir}/EBGaramond-${pkgver}/ttf/EBGaramond-Initials.ttf ${pkgdir}/usr/share/fonts/TTF/EBGaramond-Initials.ttf
  install -Dm644 ${srcdir}/OFL.txt ${pkgdir}/usr/share/licenses/ttf-ebgaramond/OFL.txt
}

md5sums=('ad76a14ea9b136557b474c3445caea08'
         '6ed93967ff0dc6dd9c8d31c17f817a06')
