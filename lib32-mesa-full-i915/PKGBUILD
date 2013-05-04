# Maintainer: Christoph Haag <haagch at studi.informatik.uni-stuttgart.de>

pkgname=lib32-mesa-full-i915
pkgver=20130504
_realver=9.2
pkgrel=1
pkgdesc="Full Mesa 3D graphics library with all its components, built from the git master branch. Compiles mesa for i915c (classic mesa). For gallium see mesa-full-i915g."
arch=('x86_64')
url="http://mesa3d.org/"
license=('LGPL')
depends=('lib32-libdrm-git' 'dri2proto>=2.1' 'glproto>=1.4.10' 'libxxf86vm' 'libxdamage' 'expat>=2.0.1' 'libxmu' 'talloc')
makedepends=('pkgconfig' 'imake' 'xorg-server-devel')
provides=("lib32-libgl=${_realver}" "lib32-mesa-libgl=${_realver}" "lib32-mesa=${_realver}" 'lib32-libglapi' 'lib32-libegl' 'lib32-libgles' 'lib32-libgbm' 'lib32-intel-dri' 'lib32-ati-dri-git' 'lib32-intel-dri-git')
conflicts=('lib32-libgl' 'lib32-mesa' 'lib32-libglapi' 'lib32-libegl' 'lib32-libgles' 'lib32-khrplatform-devel')

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

  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  # for our llvm-config for 32 bit
  export LLVM_CONFIG=/usr/bin/llvm-config32

   ./autogen.sh --prefix=/usr \
   --with-dri-driverdir=/usr/lib32/xorg/modules/dri \
   --with-dri-drivers=i915,swrast \
   --with-gallium-drivers= \
   --enable-glx-tls \
   --enable-egl \
   --disable-gallium-egl \
   --enable-gles1 \
   --enable-gles2 \
   --enable-xa \
   --enable-osmesa \
   --enable-texture-float \
   --build=x86_64-pc-linux-gnu --host=i686-pc-linux-gnu  \
   --libdir=/usr/lib32

   make
}

package() {
  cd ${_gitname}
  make DESTDIR="${pkgdir}" install

   rm -rf "${pkgdir}"/usr/{include,share,bin}

   install -d ${pkgdir}/etc/profile.d
   echo '#!/bin/bash
export LIBGL_DRIVERS_PATH=$LIBGL_DRIVERS_PATH:/usr/lib32/xorg/modules/dri' > ${pkgdir}/etc/profile.d/lib32-mesa.sh
   chmod +x ${pkgdir}/etc/profile.d/lib32-mesa.sh
   rm ${pkgdir}/usr/etc/drirc || true
}

pkgver() {
  date +%Y%m%d
}
