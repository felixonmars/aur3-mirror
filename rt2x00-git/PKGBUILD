# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Aljosha Papsch <papsch.al@gmail.com>
_pkgname=rt2x00
pkgname=rt2x00-git
pkgver=20110828
pkgrel=2
pkgdesc="A free, stable and feature rich wireless driver for rt2400, rt2500, rt2570, rt61, rt73"
arch=('i686' 'x86_64')
conflicts=('linux-firmware')
url="http://rt2x00.serialmonkey.com/"
license=('GPL' 'custom:EULA')
source=('Makefile')
sha256sums=('53159e1d3f251541b08d9a3712059743e61f15ee5d029fe563c976856ef32466')
_driverdir="${srcdir}/${_pkgname}/drivers/net/wireless/rt2x00"

build() {
  if [ -d ${srcdir}/${_pkgname} ]; then
    cd ${srcdir}/${_pkgname}
    git fetch
    cd ${srcdir}/linux-firmware
    git fetch
  else
    git clone git://git.kernel.org/pub/scm/linux/kernel/git/ivd/${_pkgname}.git ${_pkgname}
    git clone git://git.kernel.org/pub/scm/linux/kernel/git/dwmw2/linux-firmware.git linux-firmware
  fi
  cd ${srcdir}/${_pkgname}

  cp ${srcdir}/Makefile ${_driverdir}
  cd ${_driverdir}
  make
}

package() {

  cd ${_driverdir}

  install -d ${pkgdir}/lib/modules/$(uname -r)/kernel/drivers/net/wireless/rt2x00
  install -d ${pkgdir}/lib/firmware

  install -Dm644 *.ko ${pkgdir}/lib/modules/$(uname -r)/kernel/drivers/net/wireless/rt2x00
  cd ${srcdir}/linux-firmware
  install -Dm644 rt*.bin ${pkgdir}/lib/firmware
}

# vim:set ts=2 sw=2 et:
