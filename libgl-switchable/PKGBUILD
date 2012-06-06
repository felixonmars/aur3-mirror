# $Id: PKGBUILD 160367 2012-06-01 12:58:38Z dreisner $
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Maintainer: Andreas Radke <andyrtr@archlinux.org>

pkgname=('libgl-switchable')
pkgver=8.0.3
pkgrel=2
arch=('i686' 'x86_64')
makedepends=('glproto>=1.4.15' 'libdrm>=2.4.30' 'libxxf86vm>=1.1.1' 'libxdamage>=1.1.3' 'expat>=2.0.1' 'libx11>=1.4.99.1' 'libxt>=1.1.1' 
             'gcc-libs>=4.6.1' 'dri2proto>=2.6' 'python2' 'libxml2' 'imake' 'llvm' 'udev>=183')
url="http://mesa3d.sourceforge.net"
license=('custom')
source=(LICENSE
        mesa-8.0.3-llvm-3.1-fixes.patch
	libgl-switchable.install
	switchlib
	ftp://ftp.freedesktop.org/pub/mesa/${pkgver}/MesaLib-${pkgver}.tar.bz2
	)

pkgdesc="Mesa 3-D graphics library and DRI software rasterizer - switchable version. Does not conflict with catalyst and includes a script to swap symlinks."
md5sums=('5c65a0fe315dd347e09b1f2826a1df5a'
         'c452ed3392468170726c004c2f4e02ca'
         '657d6da3408fc9ac7ec8114633eb27bc'
         '14c5557431d403612512e1a60e79b68a'
         'cc5ee15e306b8c15da6a478923797171')

build() {
    cd ${srcdir}/?esa-*

    patch -Np1 -i "${srcdir}/mesa-8.0.3-llvm-3.1-fixes.patch"

     autoreconf -vfi
    ./configure --prefix=/usr \
    --with-dri-driverdir=/usr/lib/xorg/modules/dri \
    --with-gallium-drivers=r300,r600,nouveau,svga,swrast \
    --enable-gallium-llvm \
    --enable-gallium-egl \
    --enable-shared-glapi \
    --enable-gbm \
    --enable-glx-tls \
    --enable-dri \
    --enable-glx \
    --enable-osmesa \
    --enable-gles1 \
    --enable-gles2 \
    --enable-egl \
    --enable-texture-float \
    --enable-xa \
    --enable-shared-dricore

  make
}

package () {
  depends=('libdrm>=2.4.31' 'libxxf86vm>=1.1.1' 'libxdamage>=1.1.3' 'expat>=2.0.1' 'libglapi' 'gcc-libs')
  #replaces=('unichrome-dri' 'mach64-dri' 'mga-dri' 'r128-dri' 'savage-dri' 'sis-dri' 'tdfx-dri')

  cd ${srcdir}/?esa-*
  install -m755 -d "${pkgdir}/usr/lib"
  install -m755 -d "${pkgdir}/usr/lib/glx"
  install -m755 -d "${pkgdir}/usr/lib/xorg/modules/extensions"
  install -m755 -d "${pkgdir}/usr/lib/fglrx"

  bin/minstall lib/libGL.so* "${pkgdir}/usr/lib/glx"
  bin/minstall lib/libdricore.so* "${pkgdir}/usr/lib/"
  bin/minstall lib/libglsl.so* "${pkgdir}/usr/lib/"
  install -m755 "${srcdir}/switchlib" "${pkgdir}/usr/lib/fglrx/switchlibGL"
  install -m755 "${srcdir}/switchlib" "${pkgdir}/usr/lib/fglrx/switchlibglx"

  cd src/mesa/drivers/dri
  make -C ${srcdir}/?esa-*/src/gallium/targets/dri-swrast DESTDIR="${pkgdir}" install

  install -m755 -d "${pkgdir}/usr/share/licenses/libgl"
  install -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/libgl/"
}
