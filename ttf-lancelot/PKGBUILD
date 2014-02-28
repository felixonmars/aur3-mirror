# Maintainer: Christoph Glaubitz <chris at chrigl dot de>

pkgname=ttf-lancelot
pkgver=20140227
pkgrel=1
pkgdesc="Lancelot is a new ornate serif type based on French traditions. It has two sets of capitals, swash and classical. Author: Marion Kadi"
arch=('any')
url="http://www.google.com/fonts/specimen/Lancelot"
license=('custom:OFL')
depends=('fontconfig' 'xorg-font-utils')
source=('http://googlefontdirectory.googlecode.com/hg-history/0bdda0f9ba3212ba2a73672b395f85f2d11e2e8a/lancelot/Lancelot-Regular.ttf'
	'OFL.txt')
install=${pkgname}.install
md5sums=('d55c3f2557bc8415ad3b5dc9b01a6a0c'
         '6ed93967ff0dc6dd9c8d31c17f817a06')
         
package() {
  install -Dm644 ${srcdir}/Lancelot-Regular.ttf ${pkgdir}/usr/share/fonts/TTF/ttf-lancelot.ttf
  install -Dm644 ${srcdir}/OFL.txt ${pkgdir}/usr/share/licenses/ttf-lancelot/OFL.txt
}
