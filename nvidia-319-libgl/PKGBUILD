# $Id$
# Maintainer: Eric Webb <opensource @ collectivegenius.net>
# Maintainer: Thomas Baechler <thomas@archlinux.org>
# Contributor: James Rayner <iphitus@gmail.com>
pkgname=nvidia-319-libgl
pkgver=319.32
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="NVIDIA drivers libraries symlinks"
url="http://www.nvidia.com/"
depends=('nvidia-319-utils')
conflicts=('nvidia-libgl')
provides=('libgl')
license=('custom')
options=('!strip')
source=(".AURINFO")
md5sums=('307ffa866113f5aad1d7995a054fdc49')

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
    cd "${srcdir}"
    sh "${_pkg}.run" --extract-only
}

package() {
    cd "${srcdir}/${_pkg}"

    mkdir -p "${pkgdir}/usr/lib/xorg/modules/extensions"
    ln -s "/usr/lib/nvidia/xorg/modules/extensions/libglx.so.${pkgver}" "${pkgdir}/usr/lib/xorg/modules/extensions/libglx.so.${pkgver}"
    ln -s "libglx.so.${pkgver}" "${pkgdir}/usr/lib/xorg/modules/extensions/libglx.so.1"
    ln -s "libglx.so.${pkgver}" "${pkgdir}/usr/lib/xorg/modules/extensions/libglx.so"

    ln -s "/usr/lib/nvidia/libGL.so.${pkgver}" "${pkgdir}/usr/lib/libGL.so.${pkgver}"
    ln -s "libGL.so.${pkgver}" "${pkgdir}/usr/lib/libGL.so.1"
    ln -s "libGL.so.${pkgver}" "${pkgdir}/usr/lib/libGL.so"
}

