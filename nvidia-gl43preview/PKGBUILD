# $Id$
# Maintainer : Thomas Baechler <thomas@archlinux.org>

pkgname=nvidia-gl43preview
pkgver=304.15.00.02
_extramodules=extramodules-3.5-ARCH
pkgrel=2
pkgdesc="NVIDIA drivers for linux."
arch=('i686' 'x86_64')
url="http://www.nvidia.com/"
depends=('linux>=3.5' 'linux<3.6' "nvidia-utils")
makedepends=('linux-headers>=3.5' 'linux-headers<3.6')
conflicts=('nvidia-96xx' 'nvidia-173xx' 'nvidia')
replaces=('nvidia')
license=('custom')
install=nvidia.install
options=(!strip)

if [ "$CARCH" = "i686" ]; then
    _arch='x86'
    _pkg="NVIDIA-Linux-${_arch}-${pkgver}"
   source=("http://us.download.nvidia.com/opengl/4.3/linux/NVIDIA-Linux-x86-304.15.00.02.run")
    md5sums=('49173b9b0cebdf4539a78fd973501450')
elif [ "$CARCH" = "x86_64" ]; then
    _arch='x86_64'
   _pkg="NVIDIA-Linux-${_arch}-${pkgver}"
    source=("http://us.download.nvidia.com/opengl/4.3/linux/NVIDIA-Linux-x86_64-304.15.00.02.run")
   md5sums=("92c7243144159e7b746d25a804f9a198")
fi

build() {
    _kernver="$(cat /usr/lib/modules/${_extramodules}/version)"
    cd "${srcdir}"
    sh "${_pkg}.run" --extract-only
    cd "${_pkg}/kernel"
    make SYSSRC=/usr/lib/modules/"${_kernver}/build" module
}

package() {
    install -D -m644 "${srcdir}/${_pkg}/kernel/nvidia.ko" \
        "${pkgdir}/usr/lib/modules/${_extramodules}/nvidia.ko"
    install -d -m755 "${pkgdir}/usr/lib/modprobe.d"
    echo "blacklist nouveau" >> "${pkgdir}/usr/lib/modprobe.d/nvidia.conf"
    sed -i -e "s/EXTRAMODULES='.*'/EXTRAMODULES='${_extramodules}'/" "${startdir}/nvidia.install"
    gzip "${pkgdir}/usr/lib/modules/${_extramodules}/nvidia.ko"
}

