# Maintainer: MightyPork

pkgname=otf-sanfrancisco
pkgver=1.0
pkgrel=1
pkgdesc="Sans-serif font for the Apple Watch"
arch=('any')
license=('custom:Apple inc.')
depends=('fontconfig' 'xorg-font-utils')
install=$pkgname.install
url=(https://developer.apple.com/watchkit/#agreement)
source=(http://dewith.com/apple_font_sanfrancisco.zip)
md5sums=('3ef8d0e64c01856909e176380c23049c')

package() {
	cd "${srcdir}"
	cd "Font - San Francisco"

	install -d "${pkgdir}/usr/share/fonts/OTF"
	install -D -m644 "San Francisco Font License Agreement.rtf" ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.rtf

	cd "San Francisco/"

	install -m644 *.otf "${pkgdir}/usr/share/fonts/OTF/"
}
