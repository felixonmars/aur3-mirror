# Maintainer: Mitch <fragtastic69+AUR[at]gmail[.]com>
pkgname=nvidia-xen
pkgver=290.10
_kernver=`uname -r`
pkgrel=1
pkgdesc="NVIDIA drivers for kernel26."
arch=('i686' 'x86_64')
[ "$CARCH" = "i686"   ] && ARCH=x86
[ "$CARCH" = "x86_64" ] && ARCH=x86_64
url="http://www.nvidia.com/"
depends=('kernel26' "nvidia-utils=${pkgver}")
makedepends=('kernel26-headers')
conflicts=('nvidia-96xx' 'nvidia-173xx')
license=('custom')
install=nvidia.install
source=("http://download.nvidia.com/XFree86/Linux-$ARCH/$pkgver/NVIDIA-Linux-$ARCH-$pkgver.run")
md5sums=('c30af5d776e3c71c6dd8e06c30e4bf1f')
[ "$CARCH" = "x86_64" ] && md5sums=('91cd7502cb6ca3a5c0e79e33ae79881f')
build() {
	cd $srcdir
	sh NVIDIA-Linux-$ARCH-$pkgver.run --extract-only
	cd NVIDIA-Linux-$ARCH-$pkgver

	IGNORE_XEN_PRESENCE=y make SYSSRC=/lib/modules/$_kernver/build module || return 1

	mkdir -p $pkgdir/lib/modules/$_kernver/kernel/drivers/video/
	install -m644 nvidia.ko $pkgdir/lib/modules/$_kernver/kernel/drivers/video/

	sed -i -e "s/KERNEL_VERSION='.*'/KERNEL_VERSION='$_kernver'/" $startdir/nvidia.install
}
