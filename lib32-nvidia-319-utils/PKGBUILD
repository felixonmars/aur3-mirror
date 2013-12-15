# $Id$
# Maintainer: Eric Webb <opensource @ collectivegenius.net>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: James Rayner <iphitus@gmail.com>

_pkgbasename=nvidia-319-utils
pkgname=lib32-$_pkgbasename
pkgver=319.32
pkgrel=1
arch=('x86_64')
pkgdesc="NVIDIA drivers utilities (32-bit)"
url="http://www.nvidia.com/"
depends=('lib32-zlib' 'lib32-gcc-libs')
optdepends=('lib32-opencl-nvidia')
conflicts=('lib32-nvidia-utils')
license=('custom')
options=('!strip')

_arch='x86'
_pkg="NVIDIA-Linux-${_arch}-${pkgver}"
source=('.AURINFO' "ftp://download.nvidia.com/XFree86/Linux-${_arch}/${pkgver}/${_pkg}.run")
md5sums=('c1b4ab0ddc5c2f1ba3b6b581b6250393' '978339ff37c3207f3a39d3952721dcdb')

build() {
    cd "${srcdir}"
    sh ${_pkg}.run --extract-only
}

package() {
    cd "${srcdir}/${_pkg}"

    # OpenGL library
    install -D -m755 libGL.so.${pkgver} "${pkgdir}/usr/lib32/nvidia/libGL.so.${pkgver}"
    # OpenGL core library
    install -D -m755 libnvidia-glcore.so.${pkgver} "${pkgdir}/usr/lib32/libnvidia-glcore.so.${pkgver}"
    # VDPAU
    install -D -m755 libvdpau_nvidia.so.${pkgver} "${pkgdir}/usr/lib32/vdpau/libvdpau_nvidia.so.${pkgver}"
    # CUDA
    install -D -m755 libcuda.so.${pkgver} "${pkgdir}/usr/lib32/libcuda.so.${pkgver}"
    install -D -m755 libnvcuvid.so.${pkgver} "${pkgdir}/usr/lib32/libnvcuvid.so.${pkgver}"
    # nvidia-tls library
    install -D -m755 tls/libnvidia-tls.so.${pkgver} "${pkgdir}/usr/lib32/libnvidia-tls.so.${pkgver}"

    install -D -m755 libnvidia-cfg.so.${pkgver} "${pkgdir}/usr/lib32/libnvidia-cfg.so.${pkgver}"
    install -D -m755 libnvidia-ml.so.${pkgver} "${pkgdir}/usr/lib32/libnvidia-ml.so.${pkgver}"

    # create soname links
    for _lib in $(find "${pkgdir}" -name '*.so*'); do
        _soname="$(dirname ${_lib})/$(LC_ALL=C readelf -d "$_lib" | sed -nr 's/.*Library soname: \[(.*)\].*/\1/p')"
        if [ ! -e "${_soname}" ]; then
            ln -s "$(basename ${_lib})" "${_soname}"
            ln -s "$(basename ${_soname})" "${_soname/.[0-9]*/}"
        fi
    done

    rm -rf "${pkgdir}"/usr/{include,share,bin}
    mkdir -p "${pkgdir}/usr/share/licenses"
    ln -s $_pkgbasename "${pkgdir}/usr/share/licenses/${pkgname}"
}
