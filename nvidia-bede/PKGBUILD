# Maintainer : BlackEagle < ike DOT devolder AT gmail DOT com >
# Contributor: Thomas Baechler <thomas@archlinux.org>

_pkgname=nvidia
pkgname=$_pkgname-bede
pkgver=295.59
_extramodules=3.4-BEDE-external
pkgrel=1
pkgdesc="NVIDIA drivers for linux-bede"
arch=('i686' 'x86_64')
url="http://www.nvidia.com/"
makedepends=('linux-bede>=3.4' 'linux-bede<3.5' 'linux-bede-headers>=3.4' 'linux-bede-headers<3.5' "nvidia-utils=$pkgver")
conflicts=('nvidia-96xx' 'nvidia-173xx')
replaces=('nvidia-bemm')
license=('custom')
install=nvidia.install
options=(!strip)

if [ "$CARCH" = "i686" ]; then
	_arch='x86'
	_pkg="NVIDIA-Linux-$_arch-$pkgver"
	source=("http://uk.download.nvidia.com/XFree86/Linux-$_arch/$pkgver/$_pkg.run")
	md5sums=('bef732dfcf5cb079c06c1e8672d8d5dd')
elif [ "$CARCH" = "x86_64" ]; then
	_arch='x86_64'
	_pkg="NVIDIA-Linux-$_arch-$pkgver-no-compat32"
	source=("http://uk.download.nvidia.com/XFree86/Linux-$_arch/$pkgver/$_pkg.run")
	md5sums=('864d5dd1a29cb303bd355707413e2b98')
fi

build() {
	_kernver="$(cat /lib/modules/$_extramodules/version)"
	cd "$srcdir"
	sh $_pkg.run --extract-only
	cd $_pkg/kernel
	sed -e '/CFLAGS="$CFLAGS/s:-I$SOURCES/arch/x86/include:& -I$OUTPUT/arch/x86/include/generated:' -i conftest.sh
 	make SYSSRC=/lib/modules/$_kernver/build module
}

package() {
	depends=('linux-bede>=3.4' 'linux-bede<3.5' "nvidia-utils=${pkgver}")

	install -Dm644 "$srcdir/$_pkg/kernel/nvidia.ko" \
		"$pkgdir/lib/modules/$_extramodules/$_pkgname/nvidia.ko"

	install -dm755 "$pkgdir/usr/lib/modprobe.d"
	echo "blacklist nouveau" >> "$pkgdir/usr/lib/modprobe.d/$pkgname.conf"
	echo "blacklist nvidiafb" >> "$pkgdir/usr/lib/modprobe.d/$pkgname.conf"

	# gzip all modules
	find "$pkgdir" -name '*.ko' -exec gzip -9 {} \;

	sed -i -e "s/EXTRAMODULES='.*'/EXTRAMODULES='$_extramodules'/" "$startdir/nvidia.install"
}
