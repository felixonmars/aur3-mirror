# Maintainer: Tavian Barnes <tavianator@gmail.com>
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Maintainer: Andreas Radke <andyrtr@archlinux.org>
# Maintainer: Thomas Dziedzic < gostrc at gmail >
# Contributor: Antti "Tera" Oja <antti.bofh@gmail.com>
# Contributor: Michael Bostwick <mbostwick89 at gmail>

pkgbase=libgl-git
pkgname=libgl-git
#pkgname=('mesa-git' 'libgl-git' 'ati-dri-git' 'intel-dri-git'
#         'unichrome-dri-git' 'mach64-dri-git' 'mga-dri-git' 'r128-dri-git'
#         'savage-dri-git' 'sis-dri-git' 'tdfx-dri-git' 'nouveau-dri-git')
pkgver=20120923
pkgrel=2
arch=(i686 x86_64)
provides=(libgl)
license=('custom')
makedepends=('git' 'pkgconfig' 'glproto-git' 'libdrm-git' 'libxxf86vm'
             'libxdamage' 'expat' 'libx11' 'libxt' 'gcc-libs' 'dri2proto'
             'python2' 'talloc' 'libxml2' 'imake' 'llvm')
url="http://mesa3d.sourceforge.net"
license=('custom')
source=(ftp://ftp.archlinux.org/other/mesa/gl-manpages-1.0.1.tar.bz2
        LICENSE)
md5sums=('6ae05158e678f4594343f32c2ca50515'
         '5c65a0fe315dd347e09b1f2826a1df5a')

_gitroot='git://anongit.freedesktop.org/git/mesa/mesa'
_gitname='mesa'

build() {
  msg 'Connecting to git.freedesktop.org GIT server....'
  if [ -d ${_gitname} ] ; then
    cd ${_gitname} && git pull origin master
  else
    git clone ${_gitroot}
  fi
  msg 'GIT checkout done or server timeout'
  msg 'Starting make...'

  cd ${srcdir}

  # Cleanup and prepare the build dir
  [ -d build ] && rm -rf build
  cp -r ${_gitname} build
  cd build

  # python2 build fixes
  sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
         -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" $(find $srcdir -name '*.py')
  #sed -i -e "s|PYTHON2 = python|PYTHON2 = python2|" "${srcdir}"/build/configs/{default,autoconf.in}
  sed -i -e "s|PYTHON2 = python|PYTHON2 = python2|" "${srcdir}"/build/configs/{default,current.in}
  sed -i -e "s|python|python2|" "${srcdir}"/build/src/gallium/auxiliary/Makefile

  ./autogen.sh --prefix=/usr \
    --with-dri-driverdir=/usr/lib/xorg/modules/dri \
    --disable-egl \
    --enable-gallium-radeon \
    --enable-gallium-nouveau \
    --enable-glx-tls \
    --with-driver=dri \
    --enable-xcb \
    --with-state-trackers=dri,glx \
    --disable-glut
  make

  cd "${srcdir}/gl-manpages-1.0.1"
  ./configure --prefix=/usr
  make
}

package_mesa-git() {
  depends=('libgl-git' 'libx11' 'libxt' 'gcc-libs' 'dri2proto-git' 'libdrm-git' 'glproto-git')
  conflicts=('mesa')
  provides=('mesa=7.9')
  pkgdesc="Mesa 3-D graphics libraries and include files"
  
  # Fix libtool relink issue
  install -m755 -d "${pkgdir}/usr/lib/"
  cp ${srcdir}/build/lib/libdricore* ${pkgdir}/usr/lib/
	
  cd "${srcdir}"/build
  make DESTDIR="${pkgdir}" install

  rm -f "${pkgdir}/usr/lib/libGL.so"*
  rm -rf "${pkgdir}/usr/lib/xorg"
  rm -f "${pkgdir}/usr/include/GL/glew.h"
  rm -f "${pkgdir}/usr/include/GL/glut"*
  rm -f "${pkgdir}/usr/include/GL/glxew.h"
  rm -f "${pkgdir}/usr/include/GL/wglew.h"
	

  # Remove libdricore
  rm ${pkgdir}/usr/lib/libdricore*

  cd "${srcdir}/gl-manpages-1.0.1"
  make DESTDIR="${pkgdir}" install

  install -m755 -d "${pkgdir}/usr/share/licenses/mesa"
  install -m755 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/mesa/"
}

package_ati-dri-git() {
  depends=('libgl-git')
  conflicts=('ati-dri')
  provides=('ati-dri=7.9')
  pkgdesc="Mesa DRI + Gallium3D r300 drivers for AMD/ATI Radeon"

  cd "${srcdir}/build/src/mesa/drivers/dri"
  make -C radeon DESTDIR="${pkgdir}" install
  make -C r200 DESTDIR="${pkgdir}" install
  # classic mesa driver for R300 r300_dri.so
# make -C r300 DESTDIR="${pkgdir}" install  <------- depricated
  # gallium3D driver for R300 r300_dri.so
  make -C ${srcdir}/build/src/gallium/targets/dri-r300 DESTDIR="${pkgdir}" install
  make -C r600 DESTDIR="${pkgdir}" install
}

package_intel-dri-git() {
  depends=('libgl-git')
  conflicts=('intel-dri')
  provides=('intel-dri=7.9')
  pkgdesc="Mesa DRI drivers for Intel"

  cd "${srcdir}/build/src/mesa/drivers/dri"
  make -C i810 DESTDIR="${pkgdir}" install
  make -C i915 DESTDIR="${pkgdir}" install
  make -C i965 DESTDIR="${pkgdir}" install
}

package_unichrome-dri-git() {
  depends=('libgl-git')
  conflicts=('unichrome-dri')
  provides=('unichrome-dri=7.9')
  pkgdesc="Mesa DRI drivers for S3 Graphics/VIA Unichrome"

  cd "${srcdir}/build/src/mesa/drivers/dri"
  make -C unichrome DESTDIR="${pkgdir}" install
}

package_mach64-dri-git() {
  depends=('libgl-git')
  conflicts=('mach64-dri')
  provides=('mack64-dri=7.9')
  pkgdesc="Mesa DRI drivers for ATI Mach64"

  cd "${srcdir}/build/src/mesa/drivers/dri"
  make -C mach64 DESTDIR="${pkgdir}" install
}

package_mga-dri-git() {
  depends=('libgl-git')
  conflicts=('mga-dri')
  provides=('mga-dri=7.9')
  pkgdesc="Mesa DRI drivers for Matrox"

  cd "${srcdir}/build/src/mesa/drivers/dri"
  make -C mga DESTDIR="${pkgdir}" install
}

package_r128-dri-git() {
  depends=('libgl-git')
  conflicts=('r128-dri')
  provides=('r128-dri=7.9')
  pkgdesc="Mesa DRI drivers for ATI Rage128"

  cd "${srcdir}/build/src/mesa/drivers/dri"
  make -C r128 DESTDIR="${pkgdir}" install
}

package_savage-dri-git() {
  depends=('libgl-git')
  conflicts=('savage-dri')
  provides=('savage-dri=7.9')
  pkgdesc="Mesa DRI drivers for S3 Sraphics/VIA Savage"

  cd "${srcdir}/build/src/mesa/drivers/dri"
  make -C savage DESTDIR="${pkgdir}" install
}

package_sis-dri-git() {
  depends=('libgl-git')
  conflicts=('sis-dri')
  provides=('sis-dri=7.9')
  pkgdesc="Mesa DRI drivers for SiS"

  cd "${srcdir}/build/src/mesa/drivers/dri"
  make -C sis DESTDIR="${pkgdir}" install
}

package_tdfx-dri-git() {
  depends=('libgl-git')
  conflicts=('tdfx-dri')
  provides=('tdfx-dri=7.9')
  pkgdesc="Mesa DRI drivers for 3dfx"

  cd "${srcdir}/build/src/mesa/drivers/dri"
  make -C tdfx DESTDIR="${pkgdir}" install
}

package_nouveau-dri-git() {
  depends=('libgl-git')
  conflicts=('nouveau-dri')
  provides=('nouveau-dri=7.9')
  pkgdesc="Mesa classic DRI + Gallium3D drivers for Nouveau"

  cd "${srcdir}/build/src/mesa/drivers/dri"
  # classic mesa driver for nv10 , nv20 nouveau_vieux_dri.so
  make -C nouveau DESTDIR="${pkgdir}" install
  # gallium3D driver for nv30 - nv40 - nv50 nouveau_dri.so
  make -C ${srcdir}/build/src/gallium/targets/dri-nouveau DESTDIR="${pkgdir}" install
}

package_libgl-git() {
  depends=('libdrm-git' 'libxxf86vm' 'libxdamage' 'expat')
  conflicts=('libgl')
  provides=('libgl=7.9')
  pkgdesc="Mesa 3-D graphics library and DRI software rasterizer"
  # Fix libtool relink issue
  install -m755 -d "${pkgdir}/usr/lib/"
  cp ${srcdir}/build/lib/libdricore* ${pkgdir}/usr/lib/
  
  cd "${srcdir}"/build
  install -m755 -d "${pkgdir}/usr/lib"
  install -m755 -d "${pkgdir}/usr/lib/xorg/modules/extensions"

  bin/minstall lib/libGL.so* "${pkgdir}/usr/lib/"

  cd src/mesa/drivers/dri
  make -C swrast DESTDIR="${pkgdir}" install
  ln -s libglx.xorg "${pkgdir}/usr/lib/xorg/modules/extensions/libglx.so"
	
  # Remove libdricore
  rm ${pkgdir}/usr/lib/libdricore*
  
  install -m755 -d "${pkgdir}/usr/share/licenses/libgl"
  install -m755 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/libgl/"

}
