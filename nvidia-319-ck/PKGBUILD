# Maintainer: Eric Webb <opensource AT collectivegenius.net>
# Contributor: graysky <graysky AT archlnux.us>
# Contributor: A.J. Korf <jacobkorf at gmail dot com>
# Contrubutor: Thomas Baechler <thomas@archlinux.org>

pkgname=nvidia-319-ck
pkgver=319.32
_extramodules=extramodules-3.12-ck
pkgrel=0
_pkgdesc="NVIDIA drivers for linux-ck."
pkgdesc="$_pkgdesc"
arch=('i686' 'x86_64')
url="http://www.nvidia.com/"
depends=('linux-ck>=3.12' 'linux-ck<3.13' "nvidia-libgl" "nvidia-utils=${pkgver}")
makedepends=('linux-ck-headers>=3.12' 'linux-ck-headers<3.13')
conflicts=('nvidia-96xx-all' 'nvidia-173xx-all' 'nvidia-275xx-ck' 'nvidia-ck-stable' 'nvidia-beta-ck' 'nvidia-ck-atom' 'nvidia-ck-barcelona' 'nvidia-ck-bulldozer' 'nvidia-ck-corex' 'nvidia-ck-core2' 'nvidia-ck-haswell' 'nvidia-ck-ivybridge' 'nvidia-ck-kx' 'nvidia-ck-k10' 'nvidia-ck-nehalem' 'nvidia-ck-p4' 'nvidia-ck-piledriver' 'nvidia-ck-pentm' 'nvidia-ck-sandybridge' 'nvidia-304xx-ck' 'nvidia-304xx-ck-atom' 'nvidia-304xx-ck-barcelona' 'nvidia-304xx-ck-corex' 'nvidia-304xx-ck-core2' 'nvidia-304xx-ck-haswell' 'nvidia-304xx-ck-ivybridge' 'nvidia-304xx-ck-kx' 'nvidia-304xx-ck-k10' 'nvidia-304xx-ck-nehalem' 'nvidia-304xx-ck-p4' 'nvidia-304xx-ck-piledriver' 'nvidia-304xx-ck-pentm' 'nvidia-304xx-ck-sandybridge')
#groups=('ck-generic')
#replaces=()
license=('custom')
install=nvidia-ck.install
options=(!strip)
source=('nvidia-linux-3.10.patch' 'nvidia-linux-3.12.patch')
md5sums=('547b74f49f81b22f214e2770e31d62b6' '60e7c3b1241400092f8e507ae59686ea')

if [ "$CARCH" = "i686" ]; then
    _arch='x86'
    _pkg="NVIDIA-Linux-${_arch}-${pkgver}"
		source+=("ftp://download.nvidia.com/XFree86/Linux-${_arch}/${pkgver}/${_pkg}.run")
    md5sums+=('978339ff37c3207f3a39d3952721dcdb')
elif [ "$CARCH" = "x86_64" ]; then
    _arch='x86_64'
   _pkg="NVIDIA-Linux-${_arch}-${pkgver}-no-compat32"
		source+=("ftp://download.nvidia.com/XFree86/Linux-${_arch}/${pkgver}/${_pkg}.run")
		md5sums+=('d181d856768868823df3bda4607a5315')    
fi

build() {
	_kernver="$(cat /usr/lib/modules/${_extramodules}/version)"
	sh ${_pkg}.run --extract-only
	cd ${_pkg}/kernel
	patch -Np2 -i ${srcdir}/nvidia-linux-3.10.patch
	patch -Np1 -i ${srcdir}/nvidia-linux-3.12.patch
	make SYSSRC=/usr/lib/modules/"${_kernver}/build" module
}

package() {
	install -Dm644 "${srcdir}/${_pkg}/kernel/nvidia.ko" \
		"${pkgdir}/usr/lib/modules/${_extramodules}/nvidia.ko"
	install -dm755 "${pkgdir}/usr/lib/modprobe.d"
	echo "blacklist nouveau" >> "${pkgdir}/usr/lib/modprobe.d/nvidia-ck.conf"
	sed -i -e "s/EXTRAMODULES='.*'/EXTRAMODULES='${_extramodules}'/" "${startdir}/nvidia-ck.install"
	gzip -9 "${pkgdir}/usr/lib/modules/${_extramodules}/nvidia.ko"
}
