# $Id: PKGBUILD 28363 2009-03-01 00:06:27Z pierre $
# Based on default Arch nvidia-173xx package, modified for fbcondecor
# Maintainer: Xabre <Xabre_666@operamail.com>

pkgname=nvidia-173xx-fbcondecor
pkgver=173.14.25
_kernver='2.6.32-fbcondecor'
pkgrel=1
pkgdesc="NVIDIA drivers for kernel26-fbcondecor, 173xx branch."
arch=('i686' 'x86_64')
[ "$CARCH" = "i686"   ] && ARCH=x86
[ "$CARCH" = "x86_64" ] && ARCH=x86_64
url="http://www.nvidia.com/"
depends=('kernel26-fbcondecor>=2.6.32.3' 'kernel26-fbcondecor<2.6.33' 'nvidia-173xx-utils')
conflicts=('nvidia-96xx' 'nvidia')
license=('custom')
install=nvidia.install
source=("http://download.nvidia.com/XFree86/Linux-$ARCH/${pkgver}/NVIDIA-Linux-$ARCH-${pkgver}-pkg0.run")
md5sums=('397bac51f760505ea57e863c1db9c572')
[ "$CARCH" = "x86_64" ] && md5sums=('a61b6c1627984f93af73eb446a8beb5e')

build() {
	cd $srcdir
	sh NVIDIA-Linux-$ARCH-${pkgver}-pkg0.run --extract-only
	cd NVIDIA-Linux-$ARCH-${pkgver}-pkg0
	cd usr/src/nv/
	ln -s Makefile.kbuild Makefile
	make SYSSRC=/lib/modules/${_kernver}/build module || return 1

	mkdir -p $pkgdir/lib/modules/${_kernver}/kernel/drivers/video/
	install -m644 nvidia.ko $pkgdir/lib/modules/${_kernver}/kernel/drivers/video/

	sed -i -e "s/KERNEL_VERSION='.*'/KERNEL_VERSION='${_kernver}'/" $startdir/nvidia.install
}
