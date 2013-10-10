# Maintainer: Christoph Glaubitz <chris at chrigl dot de>

pkgname=ttf-philosopher
pkgver=20131010
pkgrel=1
pkgdesc="Philosopher was started in 2008 and takes inspiration from Agfa Rotis and ITC Binary. Author: Jovanny Lemonad"
arch=('any')
url="http://www.dafont.com/philosopher.font"
license=('custom:OFL')
depends=('fontconfig' 'xorg-font-utils')
source=('http://img.dafont.com/dl/?f=philosopher'
	'OFL.txt')
install=${pkgname}.install
md5sums=('80070cc06c1641652765234adaac83a6'
         '6ed93967ff0dc6dd9c8d31c17f817a06')
         
package() {
  install -Dm644 ${srcdir}/Philosopher-BoldItalic.ttf ${pkgdir}/usr/share/fonts/TTF/Philosopher-BoldItalic.ttf
  install -Dm644 ${srcdir}/Philosopher-Bold.ttf ${pkgdir}/usr/share/fonts/TTF/Philosopher-Bold.ttf
  install -Dm644 ${srcdir}/Philosopher-Italic.ttf ${pkgdir}/usr/share/fonts/TTF/Philosopher-Italic.ttf
  install -Dm644 ${srcdir}/Philosopher-Regular.ttf ${pkgdir}/usr/share/fonts/TTF/Philosopher-Regular.ttf
  install -Dm644 ${srcdir}/OFL.txt ${pkgdir}/usr/share/licenses/ttf-philosopher/OFL.txt
}
