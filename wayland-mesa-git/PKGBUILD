# Package baised on the mesa-git package
# Maintainer: Tavian Barnes <tavianator@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Antti "Tera" Oja <antti.bofh@gmail.com>
# Contributor: Diego Jose <diegoxter1006@gmail.com>

pkgbase=wayland-mesa-git
pkgname=wayland-mesa-git
#pkgname=('wayland-mesa-git' 'libgl-git' 'libglapi-git' 'libgles-git' 'libegl-git'
#         'ati-dri-git' 'intel-dri-git' 'unichrome-dri-git' 'mach64-dri-git'
#         'mga-dri-git' 'r128-dri-git' 'savage-dri-git' 'sis-dri-git'
#         'tdfx-dri-git' 'nouveau-dri-git')
pkgver=20110813
pkgrel=1
_mesaver=7.12
arch=(i686 x86_64)
makedepends=('git' 'glproto-git' 'libdrm-git' 'libxxf86vm' 'libxdamage' 'expat'
             'libx11' 'libxt' 'gcc-libs' 'dri2proto-git' 'python2' 'libxml2'
             'imake' 'llvm' 'udev')
url="http://mesa3d.sourceforge.net"
license=('custom')
source=(LICENSE)
md5sums=('5c65a0fe315dd347e09b1f2826a1df5a')

_gitroot='git://anongit.freedesktop.org/git/mesa/mesa'
_gitname='mesa'

build() {
  msg 'Connecting to git.freedesktop.org GIT server....'
  if [ -d ${_gitname} ] ; then
    cd ${_gitname} && git pull origin
  else
    git clone ${_gitroot}
  fi
  msg 'GIT checkout done or server timeout'
  msg 'Starting make...'

  cd "${srcdir}"

  # Cleanup and prepare the build dir
  [ -d build ] && rm -rf build
  cp -r ${_gitname} build
  cd build

  ./autogen.sh --prefix=/usr \
    --with-dri-driverdir=/usr/lib/xorg/modules/dri \
    --with-gallium-drivers=r300,r600,nouveau,swrast \
    --enable-shared-glapi \
    --enable-glx-tls \
    --with-driver=dri \
    --enable-xcb \
    --disable-glut \
    --enable-gles1 \
    --enable-gles2 \
    --enable-egl \
    --enable-shared-dricore \
    --enable-texture-float \
    --disable-gallium-egl \
    --with-egl-platforms=x11,wayland,drm \
    --enable-gbm \
    --enable-shared-glapi

  make
}

package_libgl-git() {
  depends=('libdrm-git' 'libxxf86vm' 'libxdamage' 'expat' 'libglapi-git' 'gcc-libs')
  conflicts=('libgl')
  provides=("libgl=${_mesaver}")
  pkgdesc="Mesa 3-D graphics library and DRI software rasterizer"

  cd "${srcdir}"/build
  install -m755 -d "${pkgdir}/usr/lib"
  install -m755 -d "${pkgdir}/usr/lib/xorg/modules/extensions"

  bin/minstall lib/libGL.so* "${pkgdir}/usr/lib/"
  bin/minstall lib/libdricore.so* "${pkgdir}/usr/lib/"
  bin/minstall lib/libglsl.so* "${pkgdir}/usr/lib/"

  cd src/mesa/drivers/dri
  #make -C swrast DESTDIR="${pkgdir}" install
  make -C "${srcdir}"/build/src/gallium/targets/dri-swrast DESTDIR="${pkgdir}" install
  #ln -s swrastg_dri.so "${pkgdir}/usr/lib/xorg/modules/dri/swrast_dri.so"
  ln -s libglx.xorg "${pkgdir}/usr/lib/xorg/modules/extensions/libglx.so"

  install -m755 -d "${pkgdir}/usr/share/licenses/libgl-git"
  install -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/libgl-git/"
}

package_libglapi-git() {
  depends=('glibc')
  conflicts=('libglapi')
  pkgdesc="free implementation of the GL API -- shared library. The Mesa GL API module is responsible for dispatching all the gl* functions"

  cd "${srcdir}"/build
  install -m755 -d "${pkgdir}/usr/lib"
  bin/minstall lib/libglapi.so* "${pkgdir}/usr/lib/"

  install -m755 -d "${pkgdir}/usr/share/licenses/libglapi"
  install -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/libglapi/"
}

package_libgles-git() {
  depends=('libglapi-git')
  conflicts=('libgles')
  provides=("libgles=${_mesaver}")
  pkgdesc="Mesa GLES libraries and headers"

  cd "${srcdir}"/build
  install -m755 -d "${pkgdir}/usr/lib"
  install -m755 -d "${pkgdir}/usr/lib/pkgconfig"
  install -m755 -d "${pkgdir}/usr/include"
  install -m755 -d "${pkgdir}/usr/include/GLES"
  install -m755 -d "${pkgdir}/usr/include/GLES2"
  bin/minstall lib/libGLESv* "${pkgdir}/usr/lib/"
  bin/minstall src/mapi/es1api/glesv1_cm.pc "${pkgdir}/usr/lib/pkgconfig/"
  bin/minstall src/mapi/es2api/glesv2.pc "${pkgdir}/usr/lib/pkgconfig/"
  bin/minstall include/GLES/* "${pkgdir}/usr/include/GLES/"
  bin/minstall include/GLES2/* "${pkgdir}/usr/include/GLES2/"
  bin/minstall include/GLES2/* "${pkgdir}/usr/include/GLES2/"

  install -m755 -d "${pkgdir}/usr/share/licenses/libgles-git"
  install -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/libgles-git/"
}

package_libegl-git() {
  depends=('libglapi-git' 'libdrm' 'libxext' 'libxfixes' 'udev')
  conflicts=('libegl')
  provides=("libegl=${_mesaver}")
  pkgdesc="Mesa libEGL libraries and headers"

  cd "${srcdir}"/build
  install -m755 -d "${pkgdir}/usr/lib"
  install -m755 -d "${pkgdir}/usr/lib/pkgconfig"
  install -m755 -d "${pkgdir}/usr/include"
  install -m755 -d "${pkgdir}/usr/include/"
  install -m755 -d "${pkgdir}/usr/include/EGL"
  install -m755 -d "${pkgdir}/usr/include/KHR"
  install -m755 -d "${pkgdir}/usr/share"
  install -m755 -d "${pkgdir}/usr/share/doc"
  install -m755 -d "${pkgdir}/usr/share/doc/libegl"
  bin/minstall lib/libEGL.so* "${pkgdir}/usr/lib/"
  install -m755 -d "${pkgdir}/usr/lib/egl"
  bin/minstall src/egl/main/egl.pc "${pkgdir}/usr/lib/pkgconfig/"
  bin/minstall include/EGL/* "${pkgdir}/usr/include/EGL/"
  bin/minstall include/KHR/khrplatform.h "${pkgdir}/usr/include/KHR/"
  bin/minstall docs/egl.html "${pkgdir}/usr/share/doc/libegl/"

  install -m755 -d "${pkgdir}/usr/share/licenses/libegl-git"
  install -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/libegl-git/"
}

package_ati-dri-git() {
  depends=('libgl-git')
  conflicts=('ati-dri' 'xf86-video-ati<6.9.0-6')
  provides=("ati-dri=${_mesaver}")
  pkgdesc="Mesa DRI + Gallium3D r300 drivers for AMD/ATI Radeon"

  make -C ${srcdir}/build/src/mesa/drivers/dri/radeon DESTDIR="${pkgdir}" install
  make -C ${srcdir}/build/src/mesa/drivers/dri/r200 DESTDIR="${pkgdir}" install
  # classic mesa driver for R300 r300_dri.so
  # gallium3D driver for R300 r300_dri.so
  make -C "${srcdir}"/build/src/gallium/targets/dri-r300 DESTDIR="${pkgdir}" install
  make -C "${srcdir}"/build/src/gallium/targets/dri-r600 DESTDIR="${pkgdir}" install
}

package_intel-dri-git() {
  depends=('libgl-git')
  conflicts=('intel-dri')
  provides=("intel-dri=${_mesaver}")
  pkgdesc="Mesa DRI drivers for Intel"

  make -C ${srcdir}/build/src/mesa/drivers/dri/i810 DESTDIR="${pkgdir}" install
  make -C ${srcdir}/build/src/mesa/drivers/dri/i915 DESTDIR="${pkgdir}" install
  make -C ${srcdir}/build/src/mesa/drivers/dri/i965 DESTDIR="${pkgdir}" install
}

package_unichrome-dri-git() {
  depends=('libgl-git')
  conflicts=('unichrome-dri')
  provides=("unichrome-dri=${_mesaver}")
  pkgdesc="Mesa DRI drivers for S3 Graphics/VIA Unichrome"

  make -C ${srcdir}/build/src/mesa/drivers/dri/unichrome DESTDIR="${pkgdir}" install
}

package_mach64-dri-git() {
  depends=('libgl-git')
  conflicts=('mach64-dri')
  provides=("mach64-dri=${_mesaver}")
  pkgdesc="Mesa DRI drivers for ATI Mach64" 
  conflicts=('xf86-video-mach64<6.8.2')

  make -C ${srcdir}/build/src/mesa/drivers/dri/mach64 DESTDIR="${pkgdir}" install
}

package_mga-dri-git() {
  depends=('libgl-git')
  conflicts=('mga-dri' 'xf86-video-mach64<6.8.2')
  provides=("mga-dri=${_mesaver}")
  pkgdesc="Mesa DRI drivers for Matrox"
  make -C ${srcdir}/build/src/mesa/drivers/dri/mga DESTDIR="${pkgdir}" install
}

package_r128-dri-git() {
  depends=('libgl-git')
  provides=("r128-dri=${_mesaver}")
  conflicts=('r128-dri' 'xf86-video-r128<6.8.1')

  pkgdesc="Mesa DRI drivers for ATI Rage128"

  make -C ${srcdir}/build/src/mesa/drivers/dri/r128 DESTDIR="${pkgdir}" install
}

package_savage-dri-git() {
  depends=('libgl-git')
  conflicts=('savage-dri' 'xf86-video-savage<2.3.1')
  provides=("savage-dri=${_mesaver}")
  pkgdesc="Mesa DRI drivers for S3 Sraphics/VIA Savage"
  make -C ${srcdir}/build/src/mesa/drivers/dri/savage DESTDIR="${pkgdir}" install
}

package_sis-dri-git() {
  depends=('libgl-git')
  conflicts=('sis-dri' 'xf86-video-sis<0.10.2')
  provides=("sis-dri=${_mesaver}")
  pkgdesc="Mesa DRI drivers for SiS"

  make -C ${srcdir}/build/src/mesa/drivers/dri/sis DESTDIR="${pkgdir}" install
}

package_tdfx-dri-git() {
  depends=('libgl-git')
  conflicts=('tdfx-dri' 'xf86-video-tdfx<1.4.3')
  provides=("tdfx-dri=${_mesaver}")
  pkgdesc="Mesa DRI drivers for 3dfx"

  make -C ${srcdir}/build/src/mesa/drivers/dri/tdfx DESTDIR="${pkgdir}" install
}

package_nouveau-dri-git() {
  depends=('libgl-git')
  conflicts=('nouveau-dri')
  provides=("nouveau-dri=${_mesaver}")
  pkgdesc="Mesa classic DRI + Gallium3D drivers for Nouveau"

  # classic mesa driver for nv10 , nv20 nouveau_vieux_dri.so
  make -C ${srcdir}/build/src/mesa/drivers/dri/nouveau DESTDIR="${pkgdir}" install
  # gallium3D driver for nv30 - nv40 - nv50 nouveau_dri.so
  make -C ${srcdir}/build/src/gallium/targets/dri-nouveau DESTDIR="${pkgdir}" install
}

package_wayland-mesa-git() {
  depends=('libgl-git' 'libx11' 'libxt' 'gcc-libs' 'dri2proto-git' 'glproto-git')
  optdepends=('opengl-man-pages: for the OpenGL API man pages')
  conflicts=('mesa')
  provides=("mesa=${_mesaver}")
  pkgdesc="Mesa 3-D graphics libraries and include files"

  cd "${srcdir}"/build
  make DESTDIR="${pkgdir}" install

  rm -f "${pkgdir}/usr/lib/libGL.so"*
  rm -f "${pkgdir}/usr/lib/libglapi.so"*
  rm -f "${pkgdir}/usr/lib/libGLESv"*
  rm -f "${pkgdir}/usr/lib/libEGL"*
  rm -rf "${pkgdir}/usr/lib/egl"
  rm -f ${pkgdir}/usr/lib/pkgconfig/{glesv1_cm.pc,glesv2.pc,egl.pc}
  rm -rf "${pkgdir}/usr/lib/xorg"
  rm -f "${pkgdir}/usr/include/GL/glew.h"
  rm -f "${pkgdir}/usr/include/GL/glxew.h"
  rm -f "${pkgdir}/usr/include/GL/wglew.h"
  rm -f "${pkgdir}/usr/include/GL/glut.h"
  rm -rf ${pkgdir}/usr/include/{GLES,GLES2,EGL,KHR}

  install -m755 -d "${pkgdir}/usr/share/licenses/wayland-mesa-git"
  install -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/wayland-mesa-git/"
}
