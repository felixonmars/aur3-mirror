# Maintainer: Christoph Glaubitz <chris at chrigl dot de>

pkgname=otf-ebgaramond
pkgver=0.015d
pkgrel=1
pkgdesc="EB Garamond is an open source project to create a revival of Claude Garamont’s famous humanist typeface from the mid-16th century"
arch=('any')
url="http://www.georgduffner.at/ebgaramond/"
license=('custom:OFL')
depends=('fontconfig' 'xorg-font-utils')
conflicts=('ttf-ebgaramond')
source=("https://bitbucket.org/georgd/eb-garamond/downloads/EBGaramond-${pkgver}.zip"
	'OFL.txt')
install=${pkgname}.install
md5sums=('e6213044c11fe34b55a1fdf3baaaf6bf'
	 '6ed93967ff0dc6dd9c8d31c17f817a06')
         
package() {
  install -Dm644 ${srcdir}/EBGaramond-${pkgver}/otf/EBGaramond08-Italic.otf ${pkgdir}/usr/share/fonts/OTF/EBGaramond08-Italic.otf
  install -Dm644 ${srcdir}/EBGaramond-${pkgver}/otf/EBGaramond08-Regular.otf ${pkgdir}/usr/share/fonts/OTF/EBGaramond08-Regular.otf
  install -Dm644 ${srcdir}/EBGaramond-${pkgver}/otf/EBGaramond08-SC.otf ${pkgdir}/usr/share/fonts/OTF/EBGaramond08-SC.otf
  install -Dm644 ${srcdir}/EBGaramond-${pkgver}/otf/EBGaramond12-Italic.otf ${pkgdir}/usr/share/fonts/OTF/EBGaramond12-Italic.otf
  install -Dm644 ${srcdir}/EBGaramond-${pkgver}/otf/EBGaramond12-AllSC.otf ${pkgdir}/usr/share/fonts/OTF/EBGaramond12-AllSC.otf
  install -Dm644 ${srcdir}/EBGaramond-${pkgver}/otf/EBGaramond12-Regular.otf ${pkgdir}/usr/share/fonts/OTF/EBGaramond12-Regular.otf
  install -Dm644 ${srcdir}/EBGaramond-${pkgver}/otf/EBGaramond12-SC.otf ${pkgdir}/usr/share/fonts/OTF/EBGaramond12-SC.otf
  install -Dm644 ${srcdir}/EBGaramond-${pkgver}/otf/EBGaramond-InitialsF1.otf ${pkgdir}/usr/share/fonts/OTF/EBGaramond-InitialsF1.otf
  install -Dm644 ${srcdir}/EBGaramond-${pkgver}/otf/EBGaramond-InitialsF2.otf ${pkgdir}/usr/share/fonts/OTF/EBGaramond-InitialsF2.otf
  install -Dm644 ${srcdir}/EBGaramond-${pkgver}/otf/EBGaramond-Initials.otf ${pkgdir}/usr/share/fonts/OTF/EBGaramond-Initials.otf
  install -Dm644 ${srcdir}/OFL.txt ${pkgdir}/usr/share/licenses/otf-ebgaramond/OFL.txt
}
