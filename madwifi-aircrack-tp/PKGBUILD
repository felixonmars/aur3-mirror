# $Id: PKGBUILD,v 1.27 2007/10/20 15:38:43 alexander Exp $
# Originally by kleptophobiac <kleptophobiac@gmail.com>
# Modified by James Rayner for the repositories <iphitus@gmail.com>
# Aircrack-ng patch applied by Lenni <lenniboy@gmail.com>
# Modified for the 2.6.25-tp kernel by tofu

_kernver=2.6.25-tp;

pkgname=madwifi-aircrack-tp
pkgver=0.9.4
pkgrel=2
pkgdesc="Madwifi drivers for Atheros wireless chipsets, patched to support packet injection"
arch=(i686 x86_64)
license=('GPL')
url="http://madwifi.org"
depends=('madwifi-utils' 'kernel26tp')
makedepends=('sharutils')
provides=('madwifi')
conflicts=('madwifi')
install=madwifi-ng.install
source=(http://snapshots.madwifi.org/madwifi-trunk/madwifi-ng-r3456-20080407.tar.gz http://patches.aircrack-ng.org/madwifi-ng-r3386v3.patch)
md5sums=('55f66dc6b7f307bd686b11db4fefaa85' '9b6fb646aa00cbc2ba1d3f1d780abff4')

build() {
  [ "${CARCH}" == "i686" ] && export ARCH=i386  
  
  cd $startdir/src/madwifi-ng-r3456-20080407
  patch -Np1 -i $startdir/src/madwifi-ng-r3386v3.patch
  sed -i -e 's/-Werror//g' Makefile.inc
  make KERNELPATH=/lib/modules/$_kernver/build KERNELRELEASE=$_kernver modules|| return 1
  make KERNELPATH=/lib/modules/$_kernver/build KERNELRELEASE=$_kernver modules \
       DESTDIR=$startdir/pkg KERNELRELEASE=$_kernver install-modules
  sed -i -e "s/KERNEL_VERSION='.*'/KERNEL_VERSION='${_kernver}'/" $startdir/*.install

  # install to wireless kernel directory
  mkdir -p $startdir/pkg/lib/modules/$_kernver/kernel/drivers/net/wireless/madwifi
  mv $startdir/pkg/lib/modules/$_kernver/net/* $startdir/pkg/lib/modules/$_kernver/kernel/drivers/net/wireless/madwifi
  rm -r $startdir/pkg/lib/modules/$_kernver/net/
}
