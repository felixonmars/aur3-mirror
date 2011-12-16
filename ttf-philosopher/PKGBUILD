# Maintainer: Christoph Glaubitz <chris at chrigl dot de>

pkgname=ttf-philosopher
pkgver=20111216
pkgrel=1
pkgdesc="Philosopher was started in 2008 and takes inspiration from Agfa Rotis and ITC Binary. Author: Jovanny Lemonad"
arch=('any')
url="http://www.dafont.com/philosopher.font"
license=('custom:OFL')
depends=('fontconfig' 'xorg-font-utils')
source=('http://img.dafont.com/dl/?f=philosopher'
	'OFL.txt')
install=${pkgname}.install
md5sums=('a0a1b61838e35988828ff44da0f166bc'
         '6ed93967ff0dc6dd9c8d31c17f817a06')
         
package() {
  install -Dm644 ${srcdir}/Philosopher.otf ${pkgdir}/usr/share/fonts/TTF/ttf-philosopher.otf
  install -Dm644 ${srcdir}/OFL.txt ${pkgdir}/usr/share/licenses/ttf-philosopher/OFL.txt
}
