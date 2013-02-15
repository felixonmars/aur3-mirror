# $Id$
# Maintainer : Youpi <max.flocard@gmail.com>
# Contributor : Thomas Baechler <thomas@archlinux.org>
 
pkgname=nvidia-bumblebee-beta
pkgver=313.18
_extramodules=extramodules-`uname -r|sed 's/\.[0-9]*\-.\-/\-/g'` 
pkgrel=4
pkgdesc="NVIDIA beta drivers for linux. Packaged for Bumblebee"
arch=('i686' 'x86_64')
url="http://www.nvidia.com/"
depends=('linux>=3.6' 'linux<3.8' "nvidia-utils-beta-bumblebee>310")
provides=("nvidia=${pkgver}")
makedepends=('linux-headers>=3.6' 'linux-headers<3.8')
conflicts=('nvidia' 'nvidia-96xx' 'nvidia-173xx' 'dkms-nvidia' 'nvidia-bumblebee')
license=('custom')
install=nvidia.install
options=(!strip)
 
if [ "$CARCH" = "i686" ]; then
    _arch='x86'
    _pkg="NVIDIA-Linux-${_arch}-${pkgver}"
    source=("ftp://download.nvidia.com/XFree86/Linux-${_arch}/${pkgver}/${_pkg}.run" 'unfuck-3.7.7.patch')
    md5sums=('780c37c28a6e06e9571cafe348b7da64' 'c62f67b481e7247d83ec8941ac114000')
elif [ "$CARCH" = "x86_64" ]; then
    _arch='x86_64'
    _pkg="NVIDIA-Linux-${_arch}-${pkgver}-no-compat32"
    source=("ftp://download.nvidia.com/XFree86/Linux-${_arch}/${pkgver}/${_pkg}.run" 'unfuck-3.7.7.patch')
    md5sums=('fa17a260793a38b4b8ae367db2e03b39' 'c62f67b481e7247d83ec8941ac114000')
fi

build() {
    _kernver="$(cat /usr/lib/modules/${_extramodules}/version || 
true)"
    cd "${srcdir}"
    sh "${_pkg}.run" --extract-only
    cd "${_pkg}/kernel"
    patch -Np1 -i "${srcdir}/unfuck-3.7.7.patch"
    make SYSSRC=/usr/lib/modules/"${_kernver}/build" module
}
 
package() {
    install -D -m644 "${srcdir}/${_pkg}/kernel/nvidia.ko" \
        "${pkgdir}/usr/lib/modules/${_extramodules}/nvidia.ko"
    install -d -m755 "${pkgdir}/usr/lib/modprobe.d"
    echo "blacklist nouveau" >> "${pkgdir}/usr/lib/modprobe.d/nouveau_blacklist.conf"
    sed -i -e "s/EXTRAMODULES='.*'/EXTRAMODULES='${_extramodules}'/" "${startdir}/nvidia.install"
    gzip "${pkgdir}/usr/lib/modules/${_extramodules}/nvidia.ko"
}
