# $Id$
# Maintainer: Eric Webb <opensource @ collectivegenius.net>
# Maintainer: Thomas Baechler <thomas@archlinux.org>
# Contributor: James Rayner <iphitus@gmail.com>
pkgname=nvidia-319-utils
pkgver=319.32
pkgrel=1
pkgdesc="NVIDIA drivers utilities"
arch=('i686' 'x86_64')
url="http://www.nvidia.com/"
depends=('xorg-server')
optdepends=('gtk2: nvidia-settings'
            'opencl-nvidia: OpenCL support')
conflicts=('nvidia-utils')
license=('custom')
options=('!strip')
source=('.AURINFO')
md5sums=('3d83c2679ca354cae77471dd2b197f81')

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

create_links() {
    # create soname links
    while read -d '' _lib; do
        _soname="$(dirname "${_lib}")/$(LC_ALL=C readelf -d "${_lib}" | sed -nr 's/.*Library soname: \[(.*)\].*/\1/p')"
        [[ -e "${_soname}" ]] || ln -s "$(basename "${_lib}")" "${_soname}"
        [[ -e "${_soname/.[0-9]*/}" ]] || ln -s "$(basename "${_soname}")" "${_soname/.[0-9]*/}"
    done < <(find "${pkgdir}" -type f -name '*.so*' -print0)
}

build() {
    cd "${srcdir}"
    sh "${_pkg}.run" --extract-only
}

package() {
    cd "${srcdir}/${_pkg}"

    # X driver
    install -D -m755 nvidia_drv.so "${pkgdir}/usr/lib/xorg/modules/drivers/nvidia_drv.so"
    # GLX extension module for X
    install -D -m755 "libglx.so.${pkgver}" "${pkgdir}/usr/lib/nvidia/xorg/modules/extensions/libglx.so.${pkgver}"
    ln -s "libglx.so.${pkgver}" "${pkgdir}/usr/lib/nvidia/xorg/modules/extensions/libglx.so"	# X doesn't find glx otherwise
    # OpenGL library
    install -D -m755 "libGL.so.${pkgver}" "${pkgdir}/usr/lib/nvidia/libGL.so.${pkgver}"
    # OpenGL core library
    install -D -m755 "libnvidia-glcore.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-glcore.so.${pkgver}"
    # VDPAU
    install -D -m755 "libvdpau_nvidia.so.${pkgver}" "${pkgdir}/usr/lib/vdpau/libvdpau_nvidia.so.${pkgver}"
    # nvidia-tls library
    install -D -m755 "tls/libnvidia-tls.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-tls.so.${pkgver}"
    install -D -m755 "libnvidia-cfg.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-cfg.so.${pkgver}"

    install -D -m755 "libnvidia-ml.so.${pkgver}" "${pkgdir}/usr/lib/libnvidia-ml.so.${pkgver}"
    # CUDA
    install -D -m755 "libcuda.so.${pkgver}" "${pkgdir}/usr/lib/libcuda.so.${pkgver}"
    install -D -m755 "libnvcuvid.so.${pkgver}" "${pkgdir}/usr/lib/libnvcuvid.so.${pkgver}"
    #install -D -m755 nvidia-cuda-proxy-server "${pkgdir}/usr/bin/nvidia-cuda-proxy-server"
    #install -D -m644 nvidia-cuda-proxy-control.1.gz "${pkgdir}/usr/share/man/man1/nvidia-cuda-proxy-control.1.gz"
    # DEBUG
    install -D -m755 nvidia-debugdump "${pkgdir}/usr/bin/nvidia-debugdump"
    # nvidia-xconfig
    install -D -m755 nvidia-xconfig "${pkgdir}/usr/bin/nvidia-xconfig"
    install -D -m644 nvidia-xconfig.1.gz "${pkgdir}/usr/share/man/man1/nvidia-xconfig.1.gz"
    # nvidia-settings
    install -D -m755 nvidia-settings "${pkgdir}/usr/bin/nvidia-settings"
    install -D -m644 nvidia-settings.1.gz "${pkgdir}/usr/share/man/man1/nvidia-settings.1.gz"
    install -D -m644 nvidia-settings.desktop "${pkgdir}/usr/share/applications/nvidia-settings.desktop"
    install -D -m644 nvidia-settings.png "${pkgdir}/usr/share/pixmaps/nvidia-settings.png"
    sed -e 's:__UTILS_PATH__:/usr/bin:' -e 's:__PIXMAP_PATH__:/usr/share/pixmaps:' -i "${pkgdir}/usr/share/applications/nvidia-settings.desktop"
    # nvidia-bug-report
    install -D -m755 nvidia-bug-report.sh "${pkgdir}/usr/bin/nvidia-bug-report.sh"
    # nvidia-smi
    install -D -m755 nvidia-smi "${pkgdir}/usr/bin/nvidia-smi"
    install -D -m644 nvidia-smi.1.gz "${pkgdir}/usr/share/man/man1/nvidia-smi.1.gz"


    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/nvidia/LICENSE"
    ln -s nvidia "${pkgdir}/usr/share/licenses/nvidia-utils"
    install -D -m644 README.txt "${pkgdir}/usr/share/doc/nvidia/README"
    install -D -m644 NVIDIA_Changelog "${pkgdir}/usr/share/doc/nvidia/NVIDIA_Changelog"
    ln -s nvidia "${pkgdir}/usr/share/doc/nvidia-utils"

    create_links
}
