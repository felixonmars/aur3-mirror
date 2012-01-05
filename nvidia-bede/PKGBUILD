# Maintainer : BlackEagle < ike DOT devolder AT gmail DOT com >
# Contributor: Thomas Baechler <thomas@archlinux.org>

_pkgname=nvidia
pkgname=${_pkgname}-bede
pkgver=290.10
_extramodules=3.2-BEDE-external
pkgrel=2
pkgdesc="NVIDIA drivers for linux-bede"
arch=('i686' 'x86_64')
url="http://www.nvidia.com/"
makedepends=('linux-bede>=3.2' 'linux-bede<3.3' 'linux-bede-headers>=3.2' 'linux-bede-headers<3.3' "nvidia-utils=${pkgver}")
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
	md5sums=('50319a4b3818c12c9c7243525e0e6316')
elif [ "$CARCH" = "x86_64" ]; then
	_arch='x86_64'
	_pkg="NVIDIA-Linux-${_arch}-${pkgver}-no-compat32"
	#source=("ftp://download.nvidia.com/XFree86/Linux-${_arch}/${pkgver}/${_pkg}.run")
	source=("http://uk.download.nvidia.com/XFree86/Linux-${_arch}/${pkgver}/${_pkg}.run")
	md5sums=('cebfba9a7e91716a06c66bb5b38d9661')
fi

build() {
	_kernver="$(cat /lib/modules/${_extramodules}/version)"
	cd $srcdir
	sh ${_pkg}.run --extract-only
	cd ${_pkg}/kernel
 	make SYSSRC=/lib/modules/${_kernver}/build module
}

package() {
	depends=('linux-bede>=3.2' 'linux-bede<3.3' "nvidia-utils=${pkgver}")

	install -dm755 $pkgdir/lib/modules/${_extramodules}/${_pkgname}
	install -Dm644 $srcdir/${_pkg}/kernel/nvidia.ko \
		$pkgdir/lib/modules/${_extramodules}/${_pkgname}/nvidia.ko

	install -dm755 $pkgdir/etc/modprobe.d
	echo "blacklist nouveau" >> $pkgdir/etc/modprobe.d/${pkgname}_nouveau_blacklist.conf

	# gzip all modules
	find ${pkgdir} -name '*.ko' -exec gzip -9 {} \;

	sed -i -e "s/EXTRAMODULES='.*'/EXTRAMODULES='${_extramodules}'/" "${startdir}/nvidia.install"
}
