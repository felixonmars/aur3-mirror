# Maintainer: Christoph Haag <haagch@studi.informatik.uni-stuttgart.de>

pkgname=mesa-full-i965
pkgver=20130623
_realver=9.3
pkgrel=1
pkgdesc="Full Mesa 3D graphics library with all its components, built from the git master branch. Compiles mesa for i965c (classic mesa)."
arch=('i686' 'x86_64')
url="http://mesa3d.org/"
license=('LGPL')
depends=('wayland' 'libdrm-git' 'dri2proto' 'glproto' 'libxxf86vm' 'libxdamage' 'expat>=2.0.1' 'libxmu' 'talloc')
makedepends=('pkgconfig' 'imake' 'xorg-server-devel')
provides=("mesa-libgl=${_realver}" "libgl=${_realver}" "mesa=${_realver}" "intel-dri=${_realver}" 'libglapi' 'libegl' 'libgles' 'libgbm' 'intel-dri' 'khrplatform-devel' 'intel-dri-git')
conflicts=('libgl' 'mesa' 'intel-dri' 'mesa-full-i915g' 'mesa-full-i965g' 'libglapi' 'libegl' 'libgles' 'khrplatform-devel')
source=("git://anongit.freedesktop.org/git/mesa/mesa")
_gitname="mesa"
md5sums=('SKIP')
#options=('!strip') # for debugging


build() {
  msg "Starting make..."
  cd ${_gitname}
  #also for debugging
  #export CFLAGS="-O0 -g3"
  #export CFLAGS="-O0 -g3"

   ./autogen.sh --prefix=/usr \
   --with-egl-platforms=x11,drm,wayland \
   --enable-shared-glapi \
   --with-dri-drivers=i965 \
   --with-gallium-drivers= \
   --with-dri-driverdir=/usr/lib/xorg/modules/dri \
   --enable-glx-tls \
   --enable-egl \
   --disable-gallium-egl \
   --disable-gallium-llvm \
   --enable-gles1 \
   --enable-gles2 \
   --enable-xa \
   --enable-osmesa \
   --enable-texture-float

   make
}

package() {
  cd ${_gitname}
   make DESTDIR="${pkgdir}" install

   install -m755 -d "${pkgdir}/usr/lib/xorg/modules/extensions"
   ln -sf libglx.xorg ${pkgdir}/usr/lib/xorg/modules/extensions/libglx.so

   install -d ${pkgdir}/etc/profile.d
   echo '#!/bin/bash' > ${pkgdir}/etc/profile.d/mesa.sh
   echo 'export LIBGL_DRIVERS_PATH=/usr/lib/xorg/modules/dri:$LIBGL_DRIVERS_PATH
export force_s3tc_enable=true
' >> ${pkgdir}/etc/profile.d/mesa.sh
  chmod +x ${pkgdir}/etc/profile.d/mesa.sh
}

pkgver() {
  date +%Y%m%d
}