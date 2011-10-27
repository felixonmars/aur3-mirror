# Maintainer : BlackEagle < ike DOT devolder AT gmail DOT com >
# Contributor: Thomas Baechler <thomas@archlinux.org>

_pkgname=nvidia
pkgname=${_pkgname}-bede
pkgver=285.05.09
_extramodules=3.1-BEDE-external
pkgrel=3
pkgdesc="NVIDIA drivers for linux-bede"
arch=('i686' 'x86_64')
url="http://www.nvidia.com/"
makedepends=('linux-bede>=3.1' 'linux-bede<3.2' 'linux-bede-headers>=3.1' 'linux-bede-headers<3.2' "nvidia-utils=${pkgver}")
conflicts=('nvidia-96xx' 'nvidia-173xx')
replaces=('nvidia-bemm')
license=('custom')
install=nvidia.install
options=(!strip)

#source=(
#"http://uk.download.nvidia.com/XFree86/Linux-x86/${pkgver}/NVIDIA-Linux-x86-${pkgver}.run"
#"http://uk.download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/NVIDIA-Linux-x86_64-${pkgver}-no-compat32.run"
#)

if [ "$CARCH" = "i686" ]; then
	_arch='x86'
	_pkg="NVIDIA-Linux-${_arch}-${pkgver}"
	#source=("ftp://download.nvidia.com/XFree86/Linux-${_arch}/${pkgver}/${_pkg}.run")
	source=("http://uk.download.nvidia.com/XFree86/Linux-${_arch}/${pkgver}/${_pkg}.run")
	md5sums=('2d469a90abef50320f548cfa8085e3a0')
elif [ "$CARCH" = "x86_64" ]; then
	_arch='x86_64'
	_pkg="NVIDIA-Linux-${_arch}-${pkgver}-no-compat32"
	#source=("ftp://download.nvidia.com/XFree86/Linux-${_arch}/${pkgver}/${_pkg}.run")
	source=("http://uk.download.nvidia.com/XFree86/Linux-${_arch}/${pkgver}/${_pkg}.run")
	md5sums=('2f4a0e78f5560c07220b7ed6fc1e27aa')
fi

build() {
	_kernver="$(cat /lib/modules/${_extramodules}/version)"
	cd $srcdir
	sh ${_pkg}.run --extract-only
	cd ${_pkg}/kernel
 	make SYSSRC=/lib/modules/${_kernver}/build module
}

package() {
	depends=('linux-bede>=3.1' 'linux-bede<3.2' "nvidia-utils=${pkgver}")

	install -dm755 $pkgdir/lib/modules/${_extramodules}/${_pkgname}
	install -Dm644 $srcdir/${_pkg}/kernel/nvidia.ko \
		$pkgdir/lib/modules/${_extramodules}/${_pkgname}/nvidia.ko

	install -dm755 $pkgdir/etc/modprobe.d
	echo "blacklist nouveau" >> $pkgdir/etc/modprobe.d/${pkgname}_nouveau_blacklist.conf

	# gzip all modules
	find ${pkgdir} -name '*.ko' -exec gzip -9 {} \;

	sed -i -e "s/EXTRAMODULES='.*'/EXTRAMODULES='${_extramodules}'/" "${startdir}/nvidia.install"
}
