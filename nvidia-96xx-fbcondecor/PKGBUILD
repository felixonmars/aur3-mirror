# $Id: PKGBUILD 32365 2009-03-30 18:26:58Z pierre $
# Maintainer : Thomas Baechler <thomas@archlinux.org>
# Modified for fbcondecor : Gregory T Helton <gt@fallendusk.org> 
# Modified for nvidia-96xx : Xabre <Xabre_666@operamail.com> 

pkgname=nvidia-96xx-fbcondecor
pkgver=96.43.16
_kernver='2.6.32-fbcondecor'
pkgrel=1
pkgdesc="NVIDIA legacy drivers for kernel26-fbcondecor, 96xx branch."
arch=('i686' 'x86_64')
[ "$CARCH" = "i686"   ] && ARCH=x86
[ "$CARCH" = "x86_64" ] && ARCH=x86_64
url="http://www.nvidia.com/"
depends=('kernel26-fbcondecor>=2.6.32.3' 'kernel26-fbcondecor<2.6.33' 
'nvidia-96xx-utils')
conflicts=('nvidia-fbcondecor' 'nvidia-173xx-fbcondecor')
license=('custom')
install=nvidia.install
source=("http://download.nvidia.com/XFree86/Linux-$ARCH/${pkgver}/NVIDIA-Linux-$ARCH-${pkgver}-pkg0.run")
md5sums=('7479b25c747e29af95b9ccf06f43fbf9')
[ "$CARCH" = "x86_64" ] && md5sums=('73e226d4ee0996b6df4bdf44cc1fc6f5')


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
