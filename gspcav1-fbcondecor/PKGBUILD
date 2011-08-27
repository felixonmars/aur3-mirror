# $Id: PKGBUILD,v 1.3 2008/01/26 15:48:21 tpowa Exp $
# Maintainer: Varun Acharya <varun@archlinux.org>
# Contributor: Giovanni Scafora <linuxmania@gmail.com>
# Contributor: Daniel Isenmann <daniel.isenmann@gmx.de>
#
# This PKGBUILD is based on the PKGBUILD of gspcav1 in ABS.
# The _kernver was changed to make use of gspca1 drivers for kernel26fbcondecor. 
# Contributor: Ning Bao <phabulosa@gmail.com>

_kernver=2.6.24-fbcondecor
pkgname=gspcav1-fbcondecor
pkgver=1.00.20
pkgrel=3
pkgdesc="gspcav1 for kernel26fbcondecor - A kernel module with support to 260 USB webcams"
arch=('i686' 'x86_64')
url="http://mxhaard.free.fr"
license=('GPL2')
depends=('kernel26fbcondecor>=2.6.24.3-1' 'kernel26fbcondecor<=2.6.25-0')
install=gspcav1.install
source=(http://mxhaard.free.fr/spca50x/Download/gspcav1-20071224.tar.gz)
md5sums=('14853ba1f4edc1e685039fca56e5ebf2')

build() {
  cd $startdir/src/gspcav1-20071224
  sed -i -e "s/KERNEL_VERSION = .*/KERNEL_VERSION = ${_kernver}/" Makefile 
  make || return 1
  
  #Install kernel module
  install -D -m644 gspca.ko $startdir/pkg/lib/modules/$_kernver/kernel/drivers/media/video/usbvideo/gspca.ko
  sed -i -e "s/KERNEL_VERSION='.*'/KERNEL_VERSION='${_kernver}'/" $startdir/*.install
}
