# $Id: PKGBUILD 189200 2013-06-29 10:08:47Z foutrelis $
# Maintainer : Thomas Baechler <thomas@archlinux.org>

pkgname=nvidia-304xx-aufs_friendly
pkgver=304.88
pkgrel=11
_goodkver=3.10
_badkver=3.11
_modver="${_goodkver}-aufs_friendly"
_extramodules="extramodules-${_modver}"
_kernver="$(cat /usr/lib/modules/${_extramodules}/version)"
_SYSSRC="/usr/lib/modules/${_kernver}/build"
pkgdesc="NVIDIA drivers for linux-aufs_friendly, 304xx legacy branch"
arch=('i686' 'x86_64')
url="http://www.nvidia.com/"
depends=("linux-aufs_friendly>=${_goodkver}" "linux-aufs_friendly<${_badkver}" "nvidia-304xx-utils=${pkgver}")
makedepends=("linux-aufs_friendly-headers>=${_goodkver}" "linux-aufs_friendly-headers<${_badkver}")
conflicts=('nvidia' 'nvidia-96xx' 'nvidia-173xx')
license=('custom')
install=nvidia.install
options=(!strip)
source=(nvidia-linux-3.10.patch)
md5sums=('f12bb3f5829b979a0d79e68b78c2ba6a')

if [ "$CARCH" = "i686" ]; then
    _arch='x86'
    _pkg="NVIDIA-Linux-${_arch}-${pkgver}"
    source+=("http://download.nvidia.com/XFree86/Linux-${_arch}/${pkgver}/${_pkg}.run")
    md5sums+=('f60d4aef766029c98914ed665235029a')
elif [ "$CARCH" = "x86_64" ]; then
    _arch='x86_64'
   _pkg="NVIDIA-Linux-${_arch}-${pkgver}-no-compat32"
    source+=("http://download.nvidia.com/XFree86/Linux-${_arch}/${pkgver}/${_pkg}.run")
    md5sums+=('35e0c7d30de795cccb6b95bda991fb77')
fi

build() {
    cd "${srcdir}"
    sh "${_pkg}.run" --extract-only
    cd "${_pkg}/kernel"
    ### Derived from the linux-3.10 patch:
    ### This patch removes AGP additional from /proc, I don't think this is correct but it makes it compile.
    patch -Np2 -i "${srcdir}/nvidia-linux-3.10.patch"
    make SYSSRC="${_SYSSRC}" module
}

package() {
    install -D -m644 "${srcdir}/${_pkg}/kernel/nvidia.ko" \
        "${pkgdir}/usr/lib/modules/${_extramodules}/nvidia.ko"
    install -d -m755 "${pkgdir}/usr/lib/modprobe.d"
    echo "blacklist nouveau" >> "${pkgdir}/usr/lib/modprobe.d/nvidia-aufs_friendly.conf"
    sed -i -e "s/EXTRAMODULES='.*'/EXTRAMODULES='${_extramodules}'/" "${startdir}/nvidia.install"
    gzip "${pkgdir}/usr/lib/modules/${_extramodules}/nvidia.ko"
}

