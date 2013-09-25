# Maintainer: A.J. Korf <jacobkorf at gmail dot com>

pkgname=nvidia-mptcp
pkgver=325.15
_extramodules=extramodules-3.10-mptcp
pkgrel=1
_pkgdesc="NVIDIA drivers for linux-mptcp."
pkgdesc="$_pkgdesc"
arch=('i686' 'x86_64')
url="http://www.nvidia.com/"
depends=('linux-mptcp' "nvidia-libgl" "nvidia-utils=${pkgver}")
license=('custom')
install=nvidia-mptcp.install
options=(!strip)

if [ "$CARCH" = "i686" ]; then
    _arch='x86'
    _pkg="NVIDIA-Linux-${_arch}-${pkgver}"
		source+=("ftp://download.nvidia.com/XFree86/Linux-${_arch}/${pkgver}/${_pkg}.run")
		md5sums+=('528fc538584de6446384b9cec3099d6c')
elif [ "$CARCH" = "x86_64" ]; then
    _arch='x86_64'
   _pkg="NVIDIA-Linux-${_arch}-${pkgver}-no-compat32"
		source+=("ftp://download.nvidia.com/XFree86/Linux-${_arch}/${pkgver}/${_pkg}.run")
		md5sums+=('63b2caa0cb128efa1a7808d7bddb2074')
fi

build() {
	_kernver="$(cat /usr/lib/modules/${_extramodules}/version)"
	sh ${_pkg}.run --extract-only
	cd ${_pkg}/kernel
	make SYSSRC=/usr/lib/modules/"${_kernver}/build" module
}

package() {
	install -Dm644 "${srcdir}/${_pkg}/kernel/nvidia.ko" \
		"${pkgdir}/usr/lib/modules/${_extramodules}/nvidia.ko"
	install -dm755 "${pkgdir}/usr/lib/modprobe.d"
	echo "blacklist nouveau" >> "${pkgdir}/usr/lib/modprobe.d/nvidia-mptcp.conf"
	sed -i -e "s/EXTRAMODULES='.*'/EXTRAMODULES='${_extramodules}'/" "${startdir}/nvidia-mptcp.install"
	gzip -9 "${pkgdir}/usr/lib/modules/${_extramodules}/nvidia.ko"
}
