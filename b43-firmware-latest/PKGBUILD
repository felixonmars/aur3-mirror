# Contributor: Xavion, modified by Octoroks. 

pkgname=b43-firmware-latest
realname=broadcom-wl
pkgver=5.100.138
pkgrel=1
pkgdesc="Firmware for Broadcom B43 wireless networking chips"
arch=("i686" "x86_64")
url="http://linuxwireless.org/en/users/Drivers/b43"
license=("GPL")
depends=("linux<3.2")
makedepends=("b43-fwcutter>=015")
options=(!emptydirs)
source=(http://www.lwfinger.com/b43-firmware/broadcom-wl-${pkgver}.tar.bz2)

package() {
	cd "${srcdir}"/${realname}-${pkgver}

	# Directories
	install -d "${pkgdir}"/lib/firmware/

	# Application
	b43-fwcutter -w "${pkgdir}/lib/firmware/" linux/wl_apsta.o
}

sha1sums=('21691a8c99c66f58d18f863ee43593d1633b454c')
