# $Id: PKGBUILD 165814 2012-08-30 20:33:25Z andyrtr $
# Maintainer: Jubei-Mitsuyoshi <jubei.house.of.five.masters@gmail.com>
# Contributor: Aaron Griffin <aaron@archlinux.org>
# Contributor: Ivailo Monev <xakepa10@gmail.com>

pkgname=('libgbm-lsd')
_axepkgname=('libgbm')
pkgver=8.1.4
_axepkgver=8.0.4
pkgrel=4
groups=('lsd')
arch=('i686' 'x86_64')
pkgdesc="Mesa gbm library -lsd version without systemd support"
url="http://mesa3d.sourceforge.net"
license=('custom')
depends=('udev')
provides=("libgbm=$pkgver")
conflicts=("libgbm<$pkgver")
makedepends=('glproto>=1.4.15' 'libdrm>=2.4.30' 'libxxf86vm>=1.1.1' 'libxdamage>=1.1.3' 'expat>=2.0.1' 'libx11>=1.4.99.1' 'libxt>=1.1.1' 
             'gcc-libs>=4.7.1-5' 'dri2proto>=2.6' 'python2' 'libxml2' 'imake' 'llvm' 'udev')
source=(LICENSE
        mesa-8.0.3-llvm-3.1-fixes.patch
        ftp://ftp.freedesktop.org/pub/mesa/${_axepkgver}/MesaLib-${_axepkgver}.tar.bz2)

md5sums=('5c65a0fe315dd347e09b1f2826a1df5a'
         'c452ed3392468170726c004c2f4e02ca'
         'd546f988adfdf986cff45b1efa2d8a46')

build() {
    cd ${srcdir}/?esa-*

    patch -Np1 -i "${srcdir}/mesa-8.0.3-llvm-3.1-fixes.patch"

     autoreconf -vfi
    ./configure --prefix=/usr \
    --with-dri-driverdir=/usr/lib/xorg/modules/dri \
    --with-gallium-drivers=r300,r600,svga,swrast \
    --with-dri-drivers=i915,i965,r200,radeon,swrast \
    --enable-gallium-llvm \
    --enable-egl \
    --enable-gallium-egl \
    --with-egl-platforms=x11,drm \
    --enable-shared-glapi \
    --enable-gbm \
    --enable-glx-tls \
    --enable-dri \
    --enable-glx \
    --enable-osmesa \
    --enable-gles1 \
    --enable-gles2 \
    --enable-texture-float \
    --enable-xa \
    --enable-shared-dricore

  make
}

package() {

  cd ${srcdir}/Mesa-*   
  install -m755 -d ${pkgdir}/usr/{include,lib/gbm}
  bin/minstall lib/libgbm.so* "${pkgdir}/usr/lib/"
  bin/minstall src/gbm/main/gbm.h "${pkgdir}/usr/include/"
  bin/minstall lib/libgbm.so* "${pkgdir}/usr/lib/"
  bin/minstall lib/gbm/gbm_gallium_drm.so* "${pkgdir}/usr/lib/gbm/"
#used for building mesa which we are not doing
#  install -m755 -d "${pkgdir}/usr/lib/pkgconfig"
#  bin/minstall src/gbm/main/gbm.pc "${pkgdir}/usr/lib/pkgconfig/"

  install -m755 -d "${pkgdir}/usr/share/licenses/libgbm"
  install -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/libgbm/"
}


