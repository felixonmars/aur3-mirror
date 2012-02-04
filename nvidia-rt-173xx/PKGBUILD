# Maintainer: Dieter Plaetinck <dieter@plaetinck.be>
# Contributor: Ray Rashif <schivmeister@gmail.com>
# Contributor: Jon Kristian Nilsen <jokr.nilsen@gmail.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>

pkgname=nvidia-rt-173xx
#pkgver=185.18.36 no matching utils package (official packages) this version
pkgver=173.14.20
_kernver='2.6.31-rt'
pkgrel=1
pkgdesc="NVIDIA legacy drivers for kernel26rt 173xx branch."
arch=('i686' 'x86_64')
[ "$CARCH" = "i686"   ] && ARCH=x86
[ "$CARCH" = "x86_64" ] && ARCH=x86_64

url="http://www.nvidia.com/"
depends=('kernel26rt>=2.6.31' 'kernel26rt<2.6.32' "nvidia-173xx-utils=$pkgver")
conflicts=('nvidia-96xx' 'nvidia' 'nvidia-71xx' 'nvidia-legacy')
license=('custom')
install=nvidia-rt.install

source=("http://download.nvidia.com/XFree86/Linux-$ARCH/${pkgver}/NVIDIA-Linux-$ARCH-${pkgver}-pkg0.run"
	rt-jengelh.patch)
md5sums=('1274759c7e17a039f322a38097de0a98' '961057d208f90ebc0b110bb0ea0a192a')
[ "$CARCH" = "x86_64" ] && md5sums=('8675e4ca65033b343c8c77b2ce82e71d' '961057d208f90ebc0b110bb0ea0a192a')

build() {
	cd $srcdir
	sh NVIDIA-Linux-$ARCH-${pkgver}-pkg0.run --extract-only
	cd NVIDIA-Linux-$ARCH-${pkgver}-pkg0

	cd usr/src/nv/

	# Apply patch for realtime kernel compatibility
	patch -Np1 -i $srcdir/rt-jengelh.patch

	ln -s Makefile.kbuild Makefile
	make SYSSRC=/lib/modules/${_kernver}/build module || return 1

	mkdir -p $pkgdir/lib/modules/${_kernver}/kernel/drivers/video/
	install -m644 nvidia.ko $pkgdir/lib/modules/${_kernver}/kernel/drivers/video/

	sed -i -e "s/KERNEL_VERSION='.*'/KERNEL_VERSION='${_kernver}'/" $startdir/$install
}
