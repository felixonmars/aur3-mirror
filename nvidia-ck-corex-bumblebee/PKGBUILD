# Maintainer: Youpi <max.flocard@gmail.com>
# Contributor: graysky <graysky AT archlnux.us>
# Contributor: A.J. Korf <jacobkorf at gmail dot com>
# Contrubutor: Thomas Baechler <thomas@archlinux.org>

pkgname=nvidia-ck-corex-bumblebee
pkgver=304.64
pkgrel=1
_extramodules=extramodules-3.6-ck
_kernver="$(cat /lib/modules/${_extramodules}/version)"
pkgdesc="NVIDIA drivers for linux-ck. Packaged for Bumblebee."
arch=('i686' 'x86_64')
url="http://www.nvidia.com/"
depends=('linux-ck>=3.6' 'linux-ck<3.7' "nvidia-utils-bumblebee=${pkgver}" "bumblebee>=3.0")
makedepends=('linux-ck-headers>=3.6' 'linux-ck-headers<3.7')
conflicts=('nvidia' 'dkms-nvidia' 'nvidia-96xx' 'nvidia-173xx' 'nvidia-96xx-all' 'nvidia-173xx-all' 'nvidia-ck-stable' 'nvidia-beta-ck' 'nvidia-ck' 'nvidia-ck-pax-bumblebee' 'nvidia-ck-bumblebee')
license=('custom')
options=(!strip)
install=nvidia-ck-corex-bumblebee.install

if [ "$CARCH" = "i686" ]; then
	_arch='x86'
	_pkg="NVIDIA-Linux-${_arch}-${pkgver}"
source=("ftp://download.nvidia.com/XFree86/Linux-${_arch}/${pkgver}/${_pkg}.run")
sha256sums=('fac8458fa8cf5b828121bbb6a55ca77ececcd2be4a5cca0376420bbded87b3c4')

elif [ "$CARCH" = "x86_64" ]; then
	_arch='x86_64'
	_pkg="NVIDIA-Linux-${_arch}-${pkgver}-no-compat32"
source=("ftp://download.nvidia.com/XFree86/Linux-${_arch}/${pkgver}/${_pkg}.run")
sha256sums=('b45bbf79599c7344decf79ade1c3d635d20578a0686cda99bc56b39f967163f4')
fi

build() {
	cd "${srcdir}"
	sh ${_pkg}.run --extract-only
	cd ${_pkg}/kernel
	make SYSSRC=/lib/modules/"${_kernver}/build" module
}

package() {
	install -D -m644 "${srcdir}/${_pkg}/kernel/nvidia.ko" "${pkgdir}/lib/modules/${_extramodules}/nvidia.ko"
	install -d -m755 "${pkgdir}/usr/lib/modprobe.d"
	echo "blacklist nouveau" >> "${pkgdir}/usr/lib/modprobe.d/nvidia-ck.conf"
	sed -i -e "s/EXTRAMODULES='.*'/EXTRAMODULES='${_extramodules}'/" "${startdir}/nvidia-ck-corex-bumblebee.install"
	gzip "${pkgdir}/lib/modules/${_extramodules}/nvidia.ko"
}
