pkgname=linux-raq550
pkgver=2.6.24.3
pkgrel=6
pkgdesc='The linux kernel for Sun Cobalt RAQ550 machines'
arch=(
	'i686'
)
url='http://www.kernel.org/'
license=GPL
depends=(
	'coreutils'
	'module-init-tools'
)
makedepends=('gcc' 'gzip' 'patch')
backup=()
source=(
	"http://www.kernel.org/pub/linux/kernel/v2.6/linux-$pkgver.tar.bz2"
	"config-raq550.conf"
	"linux-cobalt-$pkgver.patch"
)
md5sums=(
	'bb3f3af4d8feb3b81a2f14aa90186316'
	'd79c0b821a4b21c63704ffadfb378b25'
	'c7ab2a48a3da3acc1fb3009a75db01ea'
)

build() {
	# Apply configuration
	cat config-raq550.conf > $startdir/src/linux-$pkgver/.config
	
	# cd to the kernel build directory
	cd $startdir/src/linux-$pkgver/
	
	# Patch the kernel for supporting specific Sun Cobalt hardware
	patch -p0 < $startdir/linux-cobalt-$pkgver.patch
	
	# Make necessary directories
	mkdir -p $startdir/pkg/boot
	
	# Make the boot image and kernel modules
	make vmlinux
	make modules
	
	# Install kernel modules
	make INSTALL_MOD_PATH=$startdir/pkg modules_install
	
	# Install the kernel
	gzip -9 -c $startdir/src/linux-$pkgver/vmlinux > $startdir/pkg/boot/vmlinux.gz
}
