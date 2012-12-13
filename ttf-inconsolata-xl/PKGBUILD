# Maintainer: gh403 <gh403 at msstate dot edu>

pkgname=ttf-inconsolata-xl
pkgver=20121212
pkgrel=2
pkgdesc="Variant of Inconsolata that includes proper bold"
arch=('any')
url="http://www.bitcetera.com/en/techblog/2009/10/09/inconsolata-xl-font/"
license=('custom:OFL')
depends=('fontconfig' 'xorg-font-utils')
source=('http://www.bitcetera.com/page_attachments/0000/0023/InconsolataXL.zip'
	'OFL.txt')
install=${pkgname}.install
md5sums=('2a24ab9f81641b8e0c41b2e523d29bee'
         '6ed93967ff0dc6dd9c8d31c17f817a06')
         
package() {
  install -Dm644 ${srcdir}/InconsolataXL/Inconsolata\ XL.otf ${pkgdir}/usr/share/fonts/TTF/Inconsolata\ XL.otf
  install -Dm644 ${srcdir}/InconsolataXL/Inconsolata\ XL\ Bold.otf ${pkgdir}/usr/share/fonts/TTF/Inconsolata\ XL\ Bold.otf
  install -Dm644 ${srcdir}/OFL.txt ${pkgdir}/usr/share/licenses/ttf-inconsolata-xl/OFL.txt
}
