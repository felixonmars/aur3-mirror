# Maintainer: Daniel Hillenbrand <codeworkx [at] bbqlinux [dot] org>

pkgname=rtl8812au_asus-dkms
pkgver=4.2.5.10143.20140103
pkgrel=2
pkgdesc='rtl8812au linux kernel driver for ASUS USB-AC56 Wireless Dual-Band USB Adapter'
arch=('i686' 'x86_64')
license=('GPL2')
depends=('dkms' 'linux-headers')
install=${pkgname}.install
url='http://www.asus.com/us/Networking/USBAC56/#support_Download'
options=(!strip)
source=('git+https://github.com/codeworkx/rtl8812au_asus.git' 'dkms.conf')
md5sums=('SKIP' '6b1c60d76c9871b816e944d6c18037b6')

build() {
	cd ${srcdir}/rtl8812au_asus
}

package() {
	install -dm 755 "${pkgdir}/usr/src"
	cp -dr --no-preserve=ownership "${srcdir}/rtl8812au_asus" "${pkgdir}/usr/src/rtl8812au_asus-${pkgver}"
	install -D -m 644 dkms.conf "${pkgdir}/usr/src/rtl8812au_asus-${pkgver}"
}
