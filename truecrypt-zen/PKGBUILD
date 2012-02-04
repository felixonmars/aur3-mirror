# Contributor: Patrick Bartels <p4ddy.b@gmail.com>

_kernver="2.6.24-zen"

pkgname="truecrypt-zen"
pkgver="4.3a"
pkgrel="2"
pkgdesc="Free open-source disk encryption software - module for kernel26zen"
url="http://www.truecrypt.org/"
license=("custom")
arch=("i686" "x86_64")
depends=("truecrypt-utils" "kernel26zen>=2.6.24.rc2.zen0-1")
install=truecrypt.install
source=(http://www.truecrypt.org/downloads/truecrypt-$pkgver-source-code.tar.gz
        kernel-2.6.24.patch)
md5sums=('8f2536eae16e6044a22b2a82c7003357'
         '89e4ce6c57b0f179bcd2fe59c2617128')

build() {
	cd $startdir/src/truecrypt-$pkgver-source-code/Linux/Kernel

	patch -p0 < $startdir/src/kernel-2.6.24.patch

	make KERNEL_SRC=/lib/modules/$_kernver/build || return 1
	install -D -m600 ../Kernel/truecrypt.ko \
		$startdir/pkg/lib/modules/$_kernver/extra/truecrypt.ko

	# Update kernel version in .install script
	sed -i "s/KERNEL_VERSION=.*/KERNEL_VERSION=$_kernver/g" $startdir/truecrypt.install
}
