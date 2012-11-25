# Maintainer: mark@unserver.de
# Based upon the nvidia-lqx package from shivik <>, PGP Key: 761E423C

pkgname=nvidia-lqx-legacy
pkgver=304.64
_extramodules=extramodules-3.6-lqx
_kernver="$(cat /usr/lib/modules/${_extramodules}/version)"
pkgrel=1
pkgdesc="Legacy NVIDIA drivers for linux-lqx. Really? Legacy? So soon?"
arch=('i686' 'x86_64')
url="http://www.nvidia.com/"
depends=('linux-lqx>=3.6' 'linux-lqx<3.7' "nvidia-304xx-utils")
conflicts=('nvidia-173xx-lqx')
license=('custom')
options=(!strip)
install=nvidia-lqx.install
__mainserver="ftp://download.nvidia.com"
__usserver="http://us.download.nvidia.com"
__currentserver=${__mainserver}

if [ "$CARCH" = "i686" ]; then
	_arch='x86'
	_pkg="NVIDIA-Linux-${_arch}-${pkgver}"
	source=("${__currentserver}/XFree86/Linux-${_arch}/${pkgver}/${_pkg}.run")
	md5sums=('6964415cf648a5f4f38117b168369de2')
elif [ "$CARCH" = "x86_64" ]; then
	_arch='x86_64'
	_pkg="NVIDIA-Linux-${_arch}-${pkgver}-no-compat32"
	source=("${__currentserver}/XFree86/Linux-${_arch}/${pkgver}/${_pkg}.run")
	md5sums=('0ba08d32852e442ebba5ba22c7abed36')
fi

build() {
	cd "${srcdir}"
	sh ${_pkg}.run --extract-only
	cd ${_pkg}/kernel
	make SYSSRC=/usr/lib/modules/"${_kernver}/build" module
}

package() {
	install -D -m644 "${srcdir}/${_pkg}/kernel/nvidia.ko" "${pkgdir}/usr/lib/modules/${_extramodules}/nvidia.ko"
	install -d -m755 "${pkgdir}/usr/lib/modprobe.d"
	echo "blacklist nouveau" >> "${pkgdir}/usr/lib/modprobe.d/nvidia-lqx.conf"
	sed -i -e "s/EXTRAMODULES='.*'/EXTRAMODULES='${_extramodules}'/" "${startdir}/nvidia-lqx.install"
	gzip "${pkgdir}/usr/lib/modules/${_extramodules}/nvidia.ko"
}
