# Originally by kleptophobiac <kleptophobiac@gmail.com>
# Modified by James Rayner for the repositories <iphitus@gmail.com>
# Contributed by Max Nemeth <max dot nemeth at gmail dot com>

_kernver=2.6.37-ice;

pkgname=madwifi-ice
pkgver=0.9.4.4133
pkgrel=4
pkgdesc="Madwifi drivers for Atheros wireless chipsets. For ice kernel"
arch=('i686' 'x86_64')
license=('GPL')
url="http://madwifi-project.org"
depends=('madwifi-utils' 'kernel26-ice>=2.6.37' 'kernel26-ice<2.6.38')
makedepends=('sharutils' 'kernel26-headers>=2.6.37' 'kernel26-headers<2.6.38')
install=madwifi-ng.install
source=(ftp://ftp.archlinux.org/other/madwifi/madwifi-${pkgver}.tar.bz2)
md5sums=('ca3c3504d000e7b3d7063af46271c932')

build() {
  [ "${CARCH}" = "i686" ] && export ARCH=i386

  cd $startdir/src/madwifi
  sed -i -e 's/-Werror//g' Makefile.inc
  make KERNELPATH=/lib/modules/$_kernver/build KERNELRELEASE=$_kernver modules|| return 1
  make KERNELPATH=/lib/modules/$_kernver/build KERNELRELEASE=$_kernver modules \
       DESTDIR=$startdir/pkg KERNELRELEASE=$_kernver install-modules
  sed -i -e "s/KERNEL_VERSION='.*'/KERNEL_VERSION='${_kernver}'/" $startdir/*.install
}

package() {
  # install to wireless kernel directory
  mkdir -p $startdir/pkg/lib/modules/$_kernver/kernel/drivers/net/wireless/madwifi
  mv $startdir/pkg/lib/modules/$_kernver/net/* $startdir/pkg/lib/modules/$_kernver/kernel/drivers/net/wireless/madwifi
  rm -r $startdir/pkg/lib/modules/$_kernver/net/
}
