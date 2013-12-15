# $Id$
# Maintainer: Eric Webb <opensource @ collectivegenius.net>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: James Rayner <iphitus@gmail.com>

_pkgbasename=nvidia-319-libgl
pkgname=lib32-$_pkgbasename
pkgver=319.32
pkgrel=1
arch=('x86_64')
pkgdesc="NVIDIA drivers libraries symlinks (32-bit)"
url="http://www.nvidia.com/"
depends=('lib32-nvidia-319-utils')
replaces=('lib32-nvidia-utils<=313.26-1')
conflicts=('lib32-libgl' 'lib32-nvidia')
provides=('lib32-libgl')
license=('custom')
options=('!strip')

_arch='x86'
_pkg="NVIDIA-Linux-${_arch}-${pkgver}"
source=('.AURINFO' "ftp://download.nvidia.com/XFree86/Linux-${_arch}/${pkgver}/${_pkg}.run")
md5sums=('e2eba525acf71ab76d25f5ef4be24875' '978339ff37c3207f3a39d3952721dcdb')

build() {
    cd "${srcdir}"
    sh ${_pkg}.run --extract-only
}

package() {
    cd "${srcdir}/${_pkg}"

    mkdir -p "${pkgdir}/usr/lib32"
    ln -s "/usr/lib32/nvidia/libGL.so.${pkgver}" "${pkgdir}/usr/lib32/libGL.so.${pkgver}"
    ln -s "libGL.so.${pkgver}" "${pkgdir}/usr/lib32/libGL.so.1"
    ln -s "libGL.so.${pkgver}" "${pkgdir}/usr/lib32/libGL.so"
}
