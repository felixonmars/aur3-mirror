# Maintainer: Jesus Lazaro Plaza <jesuslazaro84 at gmail.com>
# Based on 'dvb-usb-rtl2838u-arch', by Peter Ivanov <ivanovp at gmail.com>

pkgname=dvb-usb-rtl2832u-stv20
_kernver="3.0-ARCH"
pkgver=1.1
pkgrel=1
pkgdesc="Kernel26 module for the RTL2832U, RTL2836U and RTL2838U DVB-T USB2.0 devices, with support for SVEON STV20 device"
arch=('i686' 'x86_64')
url="http://dev.ivanov.eu/projects/rtl2838/"
license=('GPL')
makedepends=("kernel26-headers")
provides=('dvb-usb-rtl2838u-arch')
conflicts=('dvb-usb-rtl2838u-arch' 'dvb-usb-rtl2832u-arch' 'rtl2832u-git')
install="${pkgname}.install"
source=('dvb-usb-rtl2838u.tar.gz::http://dev.ivanov.eu/projects/rtl2838/dvb-usb-rtl2838u.tar.gz'
	'stv20.patch')
md5sums=('f767d22de33e4eb3de0effff7bba7bd7'
	 '7e60bf86af350f6eee05d3794f87badc')

build() {
   cd ${srcdir}/dvb-usb-rtl2832u
   patch -Np1 -i ${srcdir}/stv20.patch
   
   export KBUILD_SRC="/usr/src/linux-${_kernver}"
   export INSTALL_MOD_PATH="${pkgdir}"
   export INSTALL_MOD_DIR=kernel/drivers/media/dvb/dvb-usb
   make -C "${KBUILD_SRC}" M="${srcdir}/dvb-usb-rtl2832u" modules
}

package() {
   make -C "${KBUILD_SRC}" M="${srcdir}/dvb-usb-rtl2832u" modules_install
} 

# vim:set ts=2 sw=2 et:
