# From the AUR:
# Maintainer: Arkranur <arkranur@gmail.com>
#
# From the official repositories:
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>

pkgbase=lib32-mesa-full-i915g
pkgdesc="experimental Gallium3D driver for certain Intel video cards, built from the latest stable mesa (32-bit). Packages lib32-intel-dri-i915g, lib32-mesa-i915g and lib32-mesa-libgl-i915g"
pkgname=$pkgbase
true && pkgname=('lib32-intel-dri-i915g' 'lib32-mesa-i915g' 'lib32-mesa-libgl-i915g') #Workaround for split packages in the AUR.
pkgver=10.1.0
pkgrel=1
arch=('x86_64')
makedepends=('python2' 'lib32-libxml2' 'lib32-expat' 'lib32-libx11' 'glproto' 'lib32-libdrm' 'dri2proto' 'dri3proto' 'presentproto' 
             'lib32-libxshmfence' 'lib32-libxxf86vm' 'lib32-libxdamage' 'gcc-multilib' 'lib32-elfutils' 'lib32-llvm' 'lib32-systemd')
url="http://mesa3d.sourceforge.net"
license=('custom')
options=('!libtool')
source=(ftp://ftp.freedesktop.org/pub/mesa/10.1/MesaLib-${pkgver}.tar.bz2)
md5sums=('3ec43f79dbcd9aa2a4a27bf1f51655b6')

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  export LLVM_CONFIG=/usr/bin/llvm-config32

  cd ${srcdir}/?esa-*

  # our automake is far too new for their build system :)
  autoreconf -vfi

  ./configure --enable-32-bit \
    --libdir=/usr/lib32 \
    --prefix=/usr \
    --sysconfdir=/etc \
    --with-dri-driverdir=/usr/lib32/xorg/modules/dri \
    --with-gallium-drivers=i915 \
    --with-dri-drivers=i915 \
    --with-llvm-shared-libs \
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
    --enable-dri3

  make
    
  mkdir $srcdir/fakeinstall
  make DESTDIR=${srcdir}/fakeinstall install
}

package_lib32-intel-dri-i915g() {
#pkgdesc="experimental Gallium3D driver for certain Intel video cards, built from the latest stable mesa (32-bit)"
  depends=('lib32-mesa-libgl-i915g' "lib32-mesa-i915g=${pkgver}" 'lib32-libtxc_dxtn' 'intel-dri-i915g')
  provides=('lib32-intel-dri')
  conflicts=('lib32-intel-dri')
  replaces=('lib32-intel-dri')

  install -m755 -d ${pkgdir}/usr/lib32/xorg/modules/dri
  mv -v ${srcdir}/fakeinstall/usr/lib32/xorg/modules/dri/i915_dri.so ${pkgdir}/usr/lib32/xorg/modules/dri/

  install -m755 -d ${pkgdir}/usr/lib32/gallium-pipe
  mv -v ${srcdir}/fakeinstall/usr/lib32/gallium-pipe/pipe_i915* ${pkgdir}/usr/lib32/gallium-pipe/

  install -m755 -d "${pkgdir}/usr/share/licenses"
  ln -s intel-dri "$pkgdir/usr/share/licenses/lib32-intel-dri"
}

package_lib32-mesa-i915g() {
  #pkgdesc="an open-source implementation of the OpenGL specification (32-bit)"
  depends=('lib32-libdrm' 'lib32-libxxf86vm' 'lib32-libxdamage' 'lib32-libxshmfence' 'lib32-systemd' 'lib32-elfutils' 'lib32-llvm-libs' 'mesa-i915g')
  optdepends=('opengl-man-pages: for the OpenGL API man pages')
  provides=('lib32-libglapi' 'lib32-osmesa' 'lib32-libgbm' 'lib32-libgles' 'lib32-libegl' 'lib32-mesa')
  conflicts=('lib32-libglapi' 'lib32-osmesa' 'lib32-libgbm' 'lib32-libgles' 'lib32-libegl' 'lib32-mesa')
  replaces=('lib32-libglapi' 'lib32-osmesa' 'lib32-libgbm' 'lib32-libgles' 'lib32-libegl' 'lib32-mesa')

  mv -v ${srcdir}/fakeinstall/* ${pkgdir}
  # rename libgl/EGL/glesv*.so to not conflict with blobs - may break .pc files ?
  mv ${pkgdir}/usr/lib32/libGL.so.1.2.0 ${pkgdir}/usr/lib32/mesa-libGL.so.1.2.0
  mv ${pkgdir}/usr/lib32/libEGL.so.1.0.0    ${pkgdir}/usr/lib32/mesa-libEGL.so.1.0.0
  mv ${pkgdir}/usr/lib32/libGLESv1_CM.so.1.1.0  ${pkgdir}/usr/lib32/mesa-libGLESv1_CM.so.1.1.0
  mv ${pkgdir}/usr/lib32/libGLESv2.so.2.0.0   ${pkgdir}/usr/lib32/mesa-libGLESv2.so.2.0.0
  
  rm ${pkgdir}/usr/lib32/lib{GL,EGL,GLESv1_CM,GLESv2}.so*
  
  rm -r ${pkgdir}/etc
  rm -r ${pkgdir}/usr/include
  
  install -m755 -d "${pkgdir}/usr/share/licenses"
  ln -s mesa "$pkgdir/usr/share/licenses/lib32-mesa"
}

package_lib32-mesa-libgl-i915g() {
  #pkgdesc="Mesa 3-D graphics library (32-bit)"
  depends=("lib32-mesa-i915g=${pkgver}")
  provides=("lib32-libgl=${pkgver}" 'lib32-mesa-libgl')
  conflicts=('lib32-mesa-libgl')
  replaces=('lib32-libgl' 'lib32-mesa-libgl')

  install -m755 -d ${pkgdir}/usr/lib32

  ln -s mesa-libGL.so.1.2.0         ${pkgdir}/usr/lib32/libGL.so
  ln -s mesa-libGL.so.1.2.0         ${pkgdir}/usr/lib32/libGL.so.1
  ln -s mesa-libGL.so.1.2.0         ${pkgdir}/usr/lib32/libGL.so.1.2.0
  ln -s mesa-libEGL.so.1.0.0        ${pkgdir}/usr/lib32/libEGL.so
  ln -s mesa-libEGL.so.1.0.0        ${pkgdir}/usr/lib32/libEGL.so.1
  ln -s mesa-libEGL.so.1.0.0        ${pkgdir}/usr/lib32/libEGL.so.1.0.0
  ln -s mesa-libGLESv1_CM.so.1.1.0  ${pkgdir}/usr/lib32/libGLESv1_CM.so
  ln -s mesa-libGLESv1_CM.so.1.1.0  ${pkgdir}/usr/lib32/libGLESv1_CM.so.1
  ln -s mesa-libGLESv1_CM.so.1.1.0  ${pkgdir}/usr/lib32/libGLESv1_CM.so.1.1.0
  ln -s mesa-libGLESv2.so.2.0.0     ${pkgdir}/usr/lib32/libGLESv2.so
  ln -s mesa-libGLESv2.so.2.0.0     ${pkgdir}/usr/lib32/libGLESv2.so.2
  ln -s mesa-libGLESv2.so.2.0.0     ${pkgdir}/usr/lib32/libGLESv2.so.2.0.0

  install -m755 -d "${pkgdir}/usr/share/licenses"
  ln -s libglapi "${pkgdir}/usr/share/licenses/lib32-libglapi"
}
