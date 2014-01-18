# Maintainer: Philipp Schmitt <philipp at schmitt dot co>

pkgname=voodoo-camera-tracker
pkgver=1.2.0_beta
_pkgver=1.2.0
pkgrel=1
pkgdesc='A tool for the integration of virtual and real scenes'
arch=('x86_64')
url='http://www.viscoda.com'
license=('unknown')
depends=('lib32-libpng12' 'lib32-bzip2' 'lib32-expat' 'lib32-fontconfig' 'lib32-freetype2' 'lib32-gcc-libs' 'lib32-glib2' 'lib32-glibc' 'lib32-glu' 'lib32-libdrm' 'lib32-libffi' 'lib32-libice' 'lib32-libsm' 'lib32-libx11' 'lib32-libxau' 'lib32-libxcb' 'lib32-libxdamage' 'lib32-libxdmcp' 'lib32-libxext' 'lib32-libxfixes' 'lib32-libxrender' 'lib32-libxt' 'lib32-libxxf86vm' 'lib32-mesa' 'lib32-mesa-libgl' 'lib32-pcre' 'lib32-qt4' 'lib32-util-linux' 'lib32-zlib')
source=("http://downloads.viscoda.com/voodoo/voodoo-x86Linux-${_pkgver}.tar.gz")
sha256sums=('acc0c2bd4abf406e1e18a58ddc68b50e6ec4779f6bb907fb2d1af44ffb900c8b')

package() {
     # Install
    mkdir -p ${pkgdir}/opt ${pkgdir}/usr/bin
    mv ${srcdir}/voodoo-x86Linux-${_pkgver}/ ${pkgdir}/opt/voodoo
    # Launcher script
    echo -e '#!/bin/sh\nLD_LIBRARY_PATH=/opt/voodoo/bin:/usr/lib32 /opt/voodoo/bin/voodoo $*' > ${srcdir}/voodoo
    install -Dm 0755 ${srcdir}/voodoo ${pkgdir}/usr/bin
}
