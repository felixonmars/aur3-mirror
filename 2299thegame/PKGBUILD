# Maintainer: Pierre Schmitz <pierre@archlinux.de>

pkgname=2299thegame
pkgver=1.0
pkgrel=1
pkgdesc='An old-school, point and click adventure game with 8-bit inspired, retro graphics.'
arch=('i686' 'x86_64')
url='http://www.2299online.com/thegame/'
license=('custom')
if [ "$CARCH" = "x86_64" ]; then
	depends=('lib32-gtk2')
elif [ "$CARCH" = "i686" ]; then
	depends=('gtk2')
fi
source=("./${pkgname}.tar.gz"
        "${pkgname}.desktop")
md5sums=('7bd67c32430dd3b30df9b6ebc554047e'
         'fa04709723c0076c22fa75dec5d6122e')

package() {
	cd "$srcdir/$pkgname"
	install -Dm755 2299 "${pkgdir}/usr/bin/2299thegame"
	install -Dm644 2299.png "${pkgdir}/usr/share/2299thegame/icon.png"
	install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
