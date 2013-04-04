# Maintainer: Duncan Townsend <duncant@mit.edu>
# Creator of nvidia-ck-bumblebee
#  igordcard <igordcard at gmail dot com>
# Creator of other packages from which this was derived
#  graysky <graysky AT archlnux.us>
#  A.J. Korf <jacobkorf at gmail dot com>
#  Thomas Baechler <thomas@archlinux.org>

pkgname=nvidia-ck-pax-bumblebee
pkgver=313.30
_extramodules=extramodules-3.8-ck-pax
_kernver="$(cat /usr/lib/modules/${_extramodules}/version)"
pkgrel=1
pkgdesc="NVIDIA drivers for linux-ck-pax. Packaged for Bumblebee."
arch=('i686' 'x86_64')
url="http://www.nvidia.com/"
depends=('linux-ck-pax>=3.8' 'linux-ck-pax<3.9' "nvidia-utils-bumblebee=${pkgver}" "bumblebee>=3.0")
makedepends=('linux-ck-pax-headers>=3.8' 'linux-ck-pax-headers<3.9')
conflicts=('nvidia' 'dkms-nvidia' 'nvidia-96xx' 'nvidia-173xx' 'nvidia-96xx-all' 'nvidia-173xx-all' 'nvidia-ck-stable' 'nvidia-beta-ck' 'nvidia-ck' 'nvidia-ck-bumblebee')
provides=("nvidia=${pkgver}" "nvidia-ck=${pkgver}" "nvidia-ck-bumblebee=${pkgver}" "nvidia-bumblebee=${pkgver}")
license=('custom')
options=(!strip)
install=nvidia-ck-pax-bumblebee.install

if [ "$CARCH" = "i686" ]; then
	_arch='x86'
	_pkg="NVIDIA-Linux-${_arch}-${pkgver}"
	source=("ftp://download.nvidia.com/XFree86/Linux-${_arch}/${pkgver}/${_pkg}.run" "nvidia-${pkgver}-pax.patch" 'unfuck-3.7.patch')
	sha256sums=('0a0f10979b1bca8e4a244e204b58aeb9a580924a9dd7b11b21d15abfe1ad49ad'
	            '55b36e9da4e4e5b6e29c10869dbbaf790e9392f9bd8b5d30ceb72bef9a302c04'
	            '5f77646dc69f0ca7204ef5523c164f7a46880f61dfdd75612119d60b1774290b')
elif [ "$CARCH" = "x86_64" ]; then
	_arch='x86_64'
	_pkg="NVIDIA-Linux-${_arch}-${pkgver}-no-compat32"
	source=("ftp://download.nvidia.com/XFree86/Linux-${_arch}/${pkgver}/${_pkg}.run" "nvidia-${pkgver}-pax.patch" 'unfuck-3.7.patch')
	sha256sums=('57da25838e4941273cf6d04e2bc1c0b3c8f7802b24397897ed2975d5551eedbd'
	            '55b36e9da4e4e5b6e29c10869dbbaf790e9392f9bd8b5d30ceb72bef9a302c04'
	            '5f77646dc69f0ca7204ef5523c164f7a46880f61dfdd75612119d60b1774290b')
fi

build() {
	cd "${srcdir}"
	sh ${_pkg}.run --extract-only
	cd ${_pkg}
	msg "Patching NVIDIA drivers for -pax"
	patch -Np1 -i "${srcdir}/nvidia-${pkgver}-pax.patch"
	cd kernel
    patch -Np1 -i "${srcdir}/unfuck-3.7.patch"
	make SYSSRC=/usr/lib/modules/"${_kernver}/build" module
}

package() {
	install -D -m644 "${srcdir}/${_pkg}/kernel/nvidia.ko" "${pkgdir}/usr/lib/modules/${_extramodules}/nvidia.ko"
	install -d -m755 "${pkgdir}/usr/lib/modprobe.d"
	echo "blacklist nouveau" >> "${pkgdir}/usr/lib/modprobe.d/nvidia-ck-pax.conf"
	sed -i -e "s/EXTRAMODULES='.*'/EXTRAMODULES='${_extramodules}'/" "${startdir}/nvidia-ck-pax-bumblebee.install"
	gzip "${pkgdir}/usr/lib/modules/${_extramodules}/nvidia.ko"
}
