# Maintainer: Dea1993 <andrea.deangelis93@gmail.com>

pkgname=telegram
pkgver=0.6.11
pkgrel=1
pkgdesc="Official telegram client"
arch=('i686' 'x86_64')
url="https://tdesktop.com"
license=('GPL3')
depends=('gcc-libs' 'libx11')
install="${pkgname}.install"

source=(
	"tsetup32.${pkgver}.tar.xz"::"https://tdesktop.com/linux32"
	"${pkgname}.png"::"https://drive.google.com/uc?id=0B8AHSEMWV-pnalRxR29abVY2THc&export=download"
	"${pkgname}.desktop"::"https://docs.google.com/uc?authuser=0&id=0B8AHSEMWV-pnQVpRTkJaWklyTGM&export=download"
	)
md5sums=(
	'8593aef75831a4309697ce3499c2e6e9'
	'781f8028411ad9857d4b69a99ef11977'
	'dd49057f8c1da51e4d67d0d037872e68'
	)

if [ "$CARCH" = x86_64 ]; then
	source[0]="tsetup.${pkgver}.tar.xz"::"https://tdesktop.com/linux"
	md5sums[0]='f9b584b09b9ed52861e32352bfe1e870'
fi

package() {
	install -m 755 -d "${pkgdir}/usr/share/applications/${pkgname}"
	install -m 755 -t "${pkgdir}/usr/share/applications/${pkgname}" "${pkgname}.desktop"
	
	install -m 755 -d "${pkgdir}/usr/share/pixmaps/"
	install -m 644 -t "${pkgdir}/usr/share/pixmaps/" "${pkgname}.png"
	
	cd "${srcdir}/Telegram"
	install -m 755 -d "${pkgdir}/usr/share/lib/${pkgname}"
	install -m 755 -t "${pkgdir}/usr/share/lib/${pkgname}" "Telegram"
	install -m 755 -t "${pkgdir}/usr/share/lib/${pkgname}" "Telegram"
	install -m 755 -t "${pkgdir}/usr/share/lib/${pkgname}" "Updater"
	
	install -m 755 -d "${pkgdir}/usr/bin"
	ln -s "/usr/share/lib/${pkgname}/Telegram" "${pkgdir}/usr/bin/${pkgname}"
} 