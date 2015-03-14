# From the AUR:
# Maintainer: ShapeShifter499
# Contributor: JSH <jsh6789 at gmail dot com>
# From the official repositories:
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Maintainer: Andreas Radke <andyrtr@archlinux.org>
#

pkgbase=mesa-full-i915g
pkgdesc="experimental Gallium3D driver for certain Intel video cards, built from the latest stable mesa. Packages mesa-dri-i915g, mesa-i915g, and mesa-libgl-i915g"
pkgname=("mesa-i915g" "mesa-libgl-i915g")
pkgver=10.4.6
pkgrel=1
arch=('i686' 'x86_64')
makedepends=('python2' 'libxml2' 'libx11' 'glproto' 'libdrm' 'dri2proto' 'dri3proto' 'presentproto' 
             'libxshmfence' 'libxxf86vm'  'libxdamage' 'libvdpau' 'wayland' 'elfutils' 'llvm' 'systemd')
url="http://mesa3d.sourceforge.net"
license=('custom')
source=(ftp://ftp.freedesktop.org/pub/mesa/${pkgver}/MesaLib-${pkgver}.tar.bz2
        LICENSE)
sha256sums=('d8baedd20e79ccd98a5a7b05e23d59a30892e68de1fcc057ca6873dafca02735'
            '7fdc119cf53c8ca65396ea73f6d10af641ba41ea1dd2bd44a824726e01c8b3f2')

build() {
  cd ${srcdir}/?esa-*

  autoreconf -vfi # our automake is far too new for their build system :)
  
  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --with-dri-driverdir=/usr/lib/xorg/modules/dri \
    --with-gallium-drivers=i915 \
    --with-dri-drivers=i915 \
    --with-egl-platforms=x11,drm,wayland \
    --with-llvm-shared-libs \
    --enable-gallium-llvm \
    --enable-egl \
    --enable-gallium-egl \
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
    --enable-vdpau \
    --enable-dri3
    # --help

  make

  # fake installation
  mkdir $srcdir/fakeinstall
  make DESTDIR=${srcdir}/fakeinstall install
}

package_mesa-i915g() {
  #pkgdesc="an open-source implementation of the OpenGL specification"
  depends=('libdrm' 'libvdpau' 'wayland' 'libxxf86vm' 'libxdamage' 'libxshmfence' 'systemd' 'elfutils' 'llvm-libs')
  optdepends=('opengl-man-pages: for the OpenGL API man pages')
  provides=('libglapi' 'osmesa' 'libgbm' 'libgles' 'libegl' 
'khrplatform-devel' 'mesa' "mesa=${pkgver}" 'libva-mesa-driver' 'mesa-dri')
  conflicts=('libglapi' 'osmesa' 'libgbm' 'libgles' 'libegl' 'khrplatform-devel' 'mesa' 'libva-mesa-driver' 'mesa-dri')
  replaces=('libglapi' 'osmesa' 'libgbm' 'libgles' 'libegl' 'khrplatform-devel'
            'ati-dri' 'intel-dri' 'nouveau-dri' 'svga-dri' 'mesa-dri')

  # mesa-dri
  install -m755 -d ${pkgdir}/usr/lib/xorg/modules/dri
  cp -r ${srcdir}/fakeinstall/usr/lib/xorg/modules/dri/i915_dri.so ${pkgdir}/usr/lib/xorg/modules/dri/
  

  cp -r ${srcdir}/fakeinstall/* ${pkgdir}
  # rename libgl/EGL/glesv*.so to not conflict with blobs - may break .pc files ?
  cp -r ${pkgdir}/usr/lib/libGL.so.1.2.0 		${pkgdir}/usr/lib/mesa-libGL.so.1.2.0
  cp -r ${pkgdir}/usr/lib/libEGL.so.1.0.0 		${pkgdir}/usr/lib/mesa-libEGL.so.1.0.0
  cp -r ${pkgdir}/usr/lib/libGLESv1_CM.so.1.1.0 	${pkgdir}/usr/lib/mesa-libGLESv1_CM.so.1.1.0
  cp -r ${pkgdir}/usr/lib/libGLESv2.so.2.0.0 	${pkgdir}/usr/lib/mesa-libGLESv2.so.2.0.0

  rm ${pkgdir}/usr/lib/lib{GL,EGL,GLESv1_CM,GLESv2}.so*

  install -m755 -d "${pkgdir}/usr/share/licenses/mesa"
  install -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/mesa/"
}

package_mesa-libgl-i915g() {
  #pkgdesc="Mesa 3-D graphics library"
  depends=("mesa-i915g=${pkgver}")
  provides=("libgl=${pkgver}" 'mesa-libgl')
  conflicts=('libgl' 'mesa-libgl')
  replaces=('libgl')
 
  # See FS#26284
  install -m755 -d "${pkgdir}/usr/lib/xorg/modules/extensions"
  ln -s libglx.xorg "${pkgdir}/usr/lib/xorg/modules/extensions/libglx.so"

  ln -s mesa-libGL.so.1.2.0 	    ${pkgdir}/usr/lib/libGL.so
  ln -s mesa-libGL.so.1.2.0         ${pkgdir}/usr/lib/libGL.so.1
  ln -s mesa-libGL.so.1.2.0         ${pkgdir}/usr/lib/libGL.so.1.2.0
  ln -s mesa-libEGL.so.1.0.0        ${pkgdir}/usr/lib/libEGL.so
  ln -s mesa-libEGL.so.1.0.0        ${pkgdir}/usr/lib/libEGL.so.1
  ln -s mesa-libEGL.so.1.0.0        ${pkgdir}/usr/lib/libEGL.so.1.0.0
  ln -s mesa-libGLESv1_CM.so.1.1.0  ${pkgdir}/usr/lib/libGLESv1_CM.so
  ln -s mesa-libGLESv1_CM.so.1.1.0  ${pkgdir}/usr/lib/libGLESv1_CM.so.1
  ln -s mesa-libGLESv1_CM.so.1.1.0  ${pkgdir}/usr/lib/libGLESv1_CM.so.1.1.0
  ln -s mesa-libGLESv2.so.2.0.0     ${pkgdir}/usr/lib/libGLESv2.so
  ln -s mesa-libGLESv2.so.2.0.0     ${pkgdir}/usr/lib/libGLESv2.so.2
  ln -s mesa-libGLESv2.so.2.0.0     ${pkgdir}/usr/lib/libGLESv2.so.2.0.0

  install -m755 -d "${pkgdir}/usr/share/licenses/mesa-libgl"
  install -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/mesa-libgl/"
}
