# Maintainer: Dan Serban
# $Id: PKGBUILD 124389 2011-05-20 13:01:59Z tpowa $
# Originally by kleptophobiac <kleptophobiac@gmail.com>
# Modified by James Rayner for the repositories <iphitus@gmail.com>

_kernver=3.0-ARCH

pkgname=madwifi
pkgver=0.9.4.4136
pkgrel=3
pkgdesc="Madwifi drivers for Atheros wireless chipsets. For stock Arch kernel"
arch=(i686 x86_64)
license=(GPL)
url=http://madwifi-project.org/
depends=('linux>=3.0.1' 'linux<3.1.0')
optdepends=(madwifi-utils madwifi-utils-svn)
makedepends=('linux-headers>=3.0.1' 'linux-headers<3.0.2' sharutils)
install=madwifi-ng.install
source=("ftp://ftp.archlinux.org/other/madwifi/madwifi-${pkgver}.tar.bz2")
md5sums=('f705acf5597ebe070efeaeb6c330748f')
options=('!strip')

build()
{
  [ "${CARCH}" = "i686" ] && export ARCH=i386
  cd ${pkgname}
  sed -i 's/-Werror//' Makefile.inc
  sed -i 's/\[4-9\]\\\./[0-9]-/' Makefile
  make KERNELPATH=/lib/modules/${_kernver}/build KERNELRELEASE=${_kernver} modules
}

package()
{
  cd ${pkgname}
  make KERNELPATH=/lib/modules/${_kernver}/build KERNELRELEASE=${_kernver} modules \
       DESTDIR="${pkgdir}" KERNELRELEASE=${_kernver} install-modules
  sed -i -e "s/KERNEL_VERSION='.*'/KERNEL_VERSION='${_kernver}'/" "${startdir}"/*.install
  mkdir -p "${pkgdir}"/lib/modules/${_kernver}/kernel/drivers/net/wireless/madwifi
  mv "${pkgdir}"/lib/modules/${_kernver}/net/* "${pkgdir}"/lib/modules/${_kernver}/kernel/drivers/net/wireless/madwifi/
  rm -r "${pkgdir}"/lib/modules/${_kernver}/net
  find "${pkgdir}" -name '*.ko' -exec gzip -9 {} \;
}

