# Maintainer: Gaetan Bisson <gaetan.bisson@loria.fr>
# Contributor: Austin ( doorknob60 [at] gmail [dot] com )

pkgname=broadcom-wl-ice
pkgver=5.60.48.36
pkgrel=2
pkgdesc='Broadcom 802.11abg networking drivers for kernel26-ice'
arch=('i686' 'x86_64')
url='http://www.broadcom.com/support/802.11/linux_sta.php'
license=('MIXED/Proprietary')
depends=('kernel26-ice>=2.6.29')
[ "$CARCH" = 'i686' ] && ARCH=x86_32
[ "$CARCH" = 'x86_64' ] && ARCH=x86_64
source=("http://www.broadcom.com/docs/linux_sta/hybrid-portsrc-${ARCH}-v${pkgver}.tar.gz")
md5sums=('0466d863405e1ab99d5e288fe886e852')
[ "$CARCH" = 'x86_64' ] && md5sums=('a78095ddcc30a191f64dccbc31b84de8')

install=install

build() {
  sed -i '190i\MODULE_LICENSE("Mixed/Proprietary"); \n' "$srcdir/src/wl/sys/wl_linux.c"
  sed -i '/linux\/autoconf.h/d' "$srcdir/src/include/linuxver.h"

  KBUILD_NOPEDANTIC=1 make -C /lib/modules/`uname -r`/build M=`pwd` || return 1
  install -D -m 755 wl.ko "$pkgdir/lib/modules/`uname -r`/kernel/drivers/net/wireless/wl.ko"
}
