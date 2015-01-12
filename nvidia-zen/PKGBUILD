# Contributor: Amaury Couste <amaury.couste@gmail.com>
# Contributor: Artem Vorotnikov <artem@vorotnikov.me>
# Contributor: A.J. Korf <jacobkorf at gmail dot com>
# Contrubutor: ilikenwf/Matt Parnell <parwok@gmail.com>
# Contributor: James Rayner <iphitus@gmail.com>
# Contributor: Bartek Piotrowski <barthalion@gmail.com>
# Contributor: Det <nimetonmaili AT gmail dot com>
# Contributor: Dan Vratil <vratil@progdansoft.com>
# Contributor: graysky <graysky AT archlnux.us>
# Contributor: mar77i <mysatyre at gmail dot com>
# Contributor: Ng Oon-Ee <n g o o n e e AT g mail dot com>
# Contributor: Nuno Aniceto aka quarkup <nuno.aja@gmail.com>
# Contributor: Peter Maatman <blackwolf12333@gmail.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>

pkgname=nvidia-zen
pkgver=343.36
_extramodules=extramodules-3.18-zen
pkgrel=1
_pkgdesc="NVIDIA drivers for linux-zen."
pkgdesc="$_pkgdesc"
arch=('i686' 'x86_64')
url="http://www.nvidia.com/"
depends=('linux-zen>=3.18' 'linux-zen<3.19' "nvidia-libgl" "nvidia-utils=${pkgver}")
makedepends=('linux-zen-headers>=3.18' 'linux-zen-headers<3.19')
conflicts=('nvidia-340xx-zen' 'nvidia-304xx-zen' 'nvidia-275xx-zen' 'nvidia-319-zen' 'nvidia-96xx-zen' 'nvidia-beta-zen' 'nvidia-zen-atom' 'nvidia-zen-barcelona' 'nvidia-zen-bulldozer' 'nvidia-zen-corex' 'nvidia-zen-core2' 'nvidia-zen-haswell' 'nvidia-zen-ivybridge' 'nvidia-zen-kx' 'nvidia-zen-k10' 'nvidia-zen-nehalem' 'nvidia-zen-p4' 'nvidia-zen-piledriver' 'nvidia-zen-pentm' 'nvidia-zen-sandybridge' 'nvidia-304xx-zen-atom' 'nvidia-304xx-zen-barcelona' 'nvidia-304xx-zen-corex' 'nvidia-304xx-zen-core2' 'nvidia-304xx-zen-haswell' 'nvidia-304xx-zen-ivybridge' 'nvidia-304xx-zen-kx' 'nvidia-304xx-zen-k10' 'nvidia-304xx-zen-nehalem' 'nvidia-304xx-zen-p4' 'nvidia-304xx-zen-piledriver' 'nvidia-304xx-zen-pentm' 'nvidia-304xx-zen-sandybridge' 'nvidia-340xx-zen-atom' 'nvidia-340xx-zen-barcelona' 'nvidia-340xx-zen-bulldozer' 'nvidia-340xx-zen-core2' 'nvidia-340xx-zen-haswell' 'nvidia-340xx-zen-ivybridge' 'nvidia-340xx-zen-kx' 'nvidia-340xx-zen-k10' 'nvidia-340xx-zen-nehalem' 'nvidia-340xx-zen-p4' 'nvidia-340xx-zen-piledriver' 'nvidia-340xx-zen-pentm' 'nvidia-340xx-zen-sandybridge')
#groups=('zen-generic')
#replaces=()
license=('custom')
install=nvidia-zen.install
options=(!strip)
source=("nv-drm.patch")
source_i686+=("ftp://download.nvidia.com/XFree86/Linux-x86/${pkgver}/NVIDIA-Linux-x86-${pkgver}.run")
source_x86_64+=("ftp://download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/NVIDIA-Linux-x86_64-${pkgver}-no-compat32.run")
md5sums=('2365f1405f0c7bbb8f8cd7ebd5e4e301')
md5sums_i686=('eae5d5407df0b371929a76f96aec4020')
md5sums_x86_64=('dfdf53ee8787455fe92a760ffa6badcb')
[[ "$CARCH" = "i686" ]] && _pkg="NVIDIA-Linux-x86-${pkgver}"
[[ "$CARCH" = "x86_64" ]] && _pkg="NVIDIA-Linux-x86_64-${pkgver}-no-compat32"

prepare() {
    sh "${_pkg}.run" --extract-only
    cd "${_pkg}"
    # patches here
		patch -Np0 -i "$srcdir/nv-drm.patch"
}

build() {
	_kernver="$(cat /usr/lib/modules/${_extramodules}/version)"
	cd "${_pkg}/kernel"
	make SYSSRC=/usr/lib/modules/"${_kernver}/build" module

	cd uvm
	make SYSSRC=/usr/lib/modules/"${_kernver}/build" module
}

package() {
	install -Dm644 "${srcdir}/${_pkg}/kernel/nvidia.ko" \
		"${pkgdir}/usr/lib/modules/${_extramodules}/nvidia.ko"
	install -D -m644 "${srcdir}/${_pkg}/kernel/uvm/nvidia-uvm.ko" \
		"${pkgdir}/usr/lib/modules/${_extramodules}/nvidia-uvm.ko"
	gzip -9 "${pkgdir}/usr/lib/modules/${_extramodules}/"*.ko
	install -dm755 "${pkgdir}/usr/lib/modprobe.d"
	echo "blacklist nouveau" >> "${pkgdir}/usr/lib/modprobe.d/nvidia-zen.conf"
}
