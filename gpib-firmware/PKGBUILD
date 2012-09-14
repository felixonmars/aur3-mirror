# Maintainer: Alex Forencich <alex@alexforencich.com>

pkgname=gpib-firmware
pkgver=20080810
pkgrel=1
pkgdesc="GPIB Firmware"
arch=('i686' 'x86_64')
license=('GPL')
url="http://linux-gpib.sourceforge.net/"
depends=('linux-gpib' 'fxload')
options=()
source=(http://linux-gpib.sourceforge.net/firmware/gpib_firmware-2008-08-10.tar.gz)
md5sums=('68cce91f2169fa94022dfcaac1651b6a')

_kernver=$(uname -r)
_extramodules=/lib/modules/${_kernver}/extramodules/

build() {
   cd "${srcdir}/gpib_firmware-2008-08-10"
}

package() {
   cd "${srcdir}/gpib_firmware-2008-08-10"
   mkdir -p ${pkgdir}/usr/share/gpib-firmware/
   cp -r * ${pkgdir}/usr/share/gpib-firmware/
}

