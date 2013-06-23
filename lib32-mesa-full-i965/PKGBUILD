# Maintainer: Christoph Haag <haagch@studi.informatik.uni-stuttgart.de>

pkgname=lib32-mesa-full-i965
pkgver=20130623
_realver=9.3
pkgrel=1
pkgdesc="Full Mesa 3D graphics library with all its components, built from the git master branch. Compiles mesa for i965c (classic mesa)."
arch=('x86_64')
url="http://mesa3d.org/"
license=('LGPL')
depends=('lib32-wayland' 'lib32-systemd' 'lib32-libdrm-git' 'dri2proto' 'glproto' 'libxxf86vm' 'libxdamage' 'expat>=2.0.1' 'libxmu' 'talloc')
makedepends=('pkgconfig' 'imake' 'xorg-server-devel')
provides=("lib32-mesa-libgl=${_realver}" "lib32-libgl=${_realver}" "lib32-mesa=${_realver}" "lib32-intel-dri=${_realver}" 'lib32-libglapi' 'lib32-libegl' 'lib32-libgles' 'lib32-libgbm' 'lib32-intel-dri' 'lib32-khrplatform-devel' 'lib32-intel-dri-git')
conflicts=('lib32-libgl' 'lib32-mesa' 'lib32-intel-dri' 'lib32-libglapi' 'lib32-libegl' 'lib32-libgles' 'lib32-mesa-full-i965g' 'khrplatform-devel')
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
   export LLVM_CONFIG=/usr/bin/llvm-config32

   ./autogen.sh --prefix=/usr \
   --with-dri-driverdir=/usr/lib32/xorg/modules/dri \
   --enable-shared-glapi \
   --with-dri-drivers=i965 \
   --with-gallium-drivers= \
   --enable-glx-tls \
   --enable-egl \
   --disable-gallium-egl \
   --disable-gallium-llvm \
   --enable-gles1 \
   --enable-gles2 \
   --enable-xa \
   --enable-osmesa \
   --enable-texture-float \
   --libdir=/usr/lib32 \
   --build=x86_64-pc-linux-gnu --host=i686-pc-linux-gnu

   make
}

package() {
  cd ${_gitname}
   make DESTDIR="${pkgdir}" install
   rm -rf "${pkgdir}"/usr/{include,share,bin} || true

   #install -m755 -d "${pkgdir}/usr/lib/xorg/modules/extensions"
   #ln -sf libglx.xorg ${pkgdir}/usr/lib/xorg/modules/extensions/libglx.so || return 1
   rm -rf ${pkgdir}/usr/etc/ || true # possibly drirc is there
   install -d ${pkgdir}/etc/profile.d
   echo '#!/bin/bash' > ${pkgdir}/etc/profile.d/lib32-mesa.sh
   echo 'export LIBGL_DRIVERS_PATH=$LIBGL_DRIVERS_PATH:/usr/lib32/xorg/modules/dri' >> ${pkgdir}/etc/profile.d/lib32-mesa.sh
   chmod +x ${pkgdir}/etc/profile.d/lib32-mesa.sh
}

pkgver() {
  date +%Y%m%d
}
