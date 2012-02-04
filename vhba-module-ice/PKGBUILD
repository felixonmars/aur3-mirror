# Maintainer: cantabile <cantabile dot desu at gmail dot com>
# Contributor (from 'vhba-module'): Charles Lindsay <charles@chaoslizard.org>
# based on 'vhba-module' in [community]

_appname='vhba-module'
_suffix='-ice'
_kernver_one='2.6.35'
_kernver_two='2.6.36'
_kernver=${_kernver_one}${_suffix}

pkgname=${_appname}${_suffix}
pkgver=1.2.1
pkgrel=2
pkgdesc="Kernel module that emulates SCSI devices. For use with kernel26${_suffix}"
arch=('i686' 'x86_64')
url="http://cdemu.sourceforge.net/"
license=('GPL2')
depends=("kernel26${_suffix}>=${_kernver_one}" "kernel26${_suffix}<${_kernver_two}")
makedepends=("kernel26-headers>=${_kernver_one}" "kernel26-headers<${_kernver_two}"
             "kernel26${_suffix}>=${_kernver_one}" "kernel26${_suffix}<${_kernver_two}")
install=${_appname}.install
source=(http://downloads.sourceforge.net/cdemu/${_appname}-${pkgver}.tar.bz2
        vhba-kernel26-2.6.34.patch)
md5sums=('a3b6ad798f2b72ef599df797ef79e5ec'
         'de68d2e744885faade0b03baff52f4a8')

build() {
  cd "${srcdir}/${_appname}-${pkgver}"
  #workaround to fix compilation against 2.6.33
  #http://bugs.gentoo.org/233910
  for i in kat/*.c; do
      sed -i "s:<linux/autoconf.h>:<generated/autoconf.h>:" "$i"
  done
  patch -Np0 -i "${srcdir}/vhba-kernel26-2.6.34.patch" || return 1

  make -j1 KDIR=/usr/src/linux-${_kernver} || return 1
  install -D vhba.ko "${pkgdir}/lib/modules/${_kernver}/extra/vhba.ko" || return 1
}
