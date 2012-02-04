# Contributor: Patrick Bartels <p4ddy.b@gmail.com>

[ "$CARCH" = "i686"   ] && _arch="x86"
[ "$CARCH" = "x86_64" ] && _arch="x86_64"

_kernver="2.6.24-zen"

pkgname="nvidia-96xx-zen"
pkgver="96.43.05"
pkgrel="1"
pkgdesc="NVIDIA legacy drivers for kernel26zen, 96xx branch"
url="http://www.nvidia.com/"
license=("custom")
arch=("i686" "x86_64")
depends=("kernel26zen" "nvidia-96xx-utils>=96.43.05")
conflicts=("nvidia-zen" "nvidia-beta-zen" "nvidia-71xx-zen")
install=nvidia.install
source=(http://us.download.nvidia.com/XFree86/Linux-$_arch/$pkgver/NVIDIA-Linux-$_arch-$pkgver-pkg0.run)
md5sums=('575750b17f9fd19490fd999a72c7a661')
[ "$CARCH" = "x86_64" ] && md5sums=('da37aa996073c4e813eda1be150a44d8')

build() {
	cd $startdir/src

	sh NVIDIA-Linux-$_arch-$pkgver-pkg0.run --extract-only
	cd NVIDIA-Linux-$_arch-$pkgver-pkg0/usr/src/nv
	
	ln -s Makefile.kbuild Makefile
	make SYSSRC=/lib/modules/$_kernver/build module || return 1

	mkdir -p $startdir/pkg/lib/modules/$_kernver/kernel/drivers/video
	install -m644 nvidia.ko $startdir/pkg/lib/modules/$_kernver/kernel/drivers/video

	sed -i "s/KERNEL_VERSION='.*'/KERNEL_VERSION='$_kernver'/g" $startdir/nvidia.install
}
