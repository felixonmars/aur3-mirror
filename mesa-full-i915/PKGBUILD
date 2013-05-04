# Maintainer: Christoph Haag <haagch at studi.informatik.uni-stuttgart.de>

pkgname=mesa-full-i915
pkgver=20130504
_realver=9.2
pkgrel=1
pkgdesc="Full Mesa 3D graphics library with all its components, built from the git master branch. Compiles mesa for i915c (classic mesa). For gallium see mesa-full-i915g."
arch=('i686' 'x86_64')
url="http://mesa3d.org/"
license=('LGPL')
depends=('libdrm-git' 'dri2proto>=2.1' 'glproto>=1.4.10' 'libxxf86vm' 'libxdamage' 'expat>=2.0.1' 'libxmu' 'talloc' 'wayland')
makedepends=('pkgconfig' 'imake' 'xorg-server-devel')
provides=("mesa-libgl=${_realver}" "libgl=${_realver}" "mesa=${_realver}" "intel-dri=${_realver}" 'libglapi' 'libegl' 'libgles' 'libgbm' 'intel-dri' 'khrplatform-devel' 'intel-dri-git')
conflicts=('libgl' 'mesa' 'intel-dri' 'mesa-full-i915g' 'libglapi' 'libegl' 'libgles' 'khrplatform-devel')
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
	--with-dri-drivers=i915 \
	--with-gallium-drivers= \
	--with-dri-driverdir=/usr/lib/xorg/modules/dri \
	--enable-glx-tls \
	--enable-egl \
	--disable-gallium-egl \
	--enable-glu \
	--enable-gles1 \
	--enable-gles2 \
	--enable-xa \
	--enable-xorg \
	--enable-osmesa \
	--enable-texture-float

  #--enable-debug \

  make
}

package() {
  cd ${_gitname}
  make DESTDIR="${pkgdir}" install

  install -m755 -d "${pkgdir}/usr/lib/xorg/modules/extensions"
  ln -sf libglx.xorg ${pkgdir}/usr/lib/xorg/modules/extensions/libglx.so

  install -d ${pkgdir}/etc/profile.d
  echo '#!/bin/bash
export LIBGL_DRIVERS_PATH=/usr/lib/xorg/modules/dri:$LIBGL_DRIVERS_PATH
' > ${pkgdir}/etc/profile.d/mesa.sh
  chmod +x ${pkgdir}/etc/profile.d/mesa.sh
}

pkgver() {
  date +%Y%m%d
}
