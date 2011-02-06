# Maintainer: Thomas Dziedzic < gostrc at gmail >
# Contributor: LEW21 <lew21@xtreeme.org>
# Contributor: Radu Andries <admiral0@tuxfamily.org>

pkgname=lib32-mesa-full
pkgver=20100914
_realver=7.8.2
pkgrel=1
pkgdesc='Full Mesa 3D graphics library with all its components, built from the git master branch.'
arch=('i686' 'x86_64')
url="http://mesa3d.org/"
license=('LGPL')
depends=('lib32-talloc' 'libdrm' 'dri2proto' 'glproto' 'libxxf86vm' 'libxdamage' 'expat')
provides=("lib32-libgl=${_realver}" "lib32-mesa=${_realver}" "lib32-glut=${_realver}" "lib32-ati-dri=${_realver}" "lib32-intel-dri=${_realver}" "lib32-mach64-dri=${_realver}" "lib32-mga-dri=${_realver}" "lib32-r128-dri=${_realver}" "lib32-savage-dri=${_realver}" "lib32-tdfx-dri=${_realver}" "lib32-unichrome-dri=${_realver}")
replaces=('lib32-libgl' 'lib32-mesa' 'lib32-glut' 'lib32-freeglut' 'lib32-ati-dri' 'lib32-intel-dri' 'lib32-mach64-dri' 'lib32-mga-dri' 'lib32-r128-dri' 'lib32-savage-dri' 'lib32-tdfx-dri' 'lib32-unichrome-dri')
conflicts=('lib32-libgl' 'lib32-mesa' 'lib32-glut' 'lib32-freeglut' 'lib32-ati-dri' 'lib32-intel-dri' 'lib32-mach64-dri' 'lib32-mga-dri' 'lib32-r128-dri' 'lib32-savage-dri' 'lib32-tdfx-dri' 'lib32-unichrome-dri')
options=(!makeflags)

_gitroot='git://anongit.freedesktop.org/git/mesa/mesa'
_gitname='mesa'

build() {
  msg 'Connecting to git.freedesktop.org GIT server....'

  if [ -d ${_gitname} ] ; then
    cd ${_gitname}
    git pull origin
    msg 'The local files are updated.'
  else
    git clone ${_gitroot}
  fi

  msg 'GIT checkout done or server timeout'
  msg 'Starting make...'

  cd ${srcdir}

  rm -rf build
  cp -rH ${_gitname} build
  cd build
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  ./autogen.sh --prefix=/usr \
    --with-dri-driverdir=/usr/lib32/xorg/modules/dri \
    --with-dri-drivers=swrast,radeon,r200,r300,r600,i810,i915,i965,unichrome,mach64,mga,r128,savage,sis,tdfx \
    --disable-egl \
    --disable-gallium-intel \
    --enable-glx-tls \
    --with-driver=dri \
    --enable-xcb \
    --with-state-trackers=dri,glx \
    --enable-gallium-nouveau \
    --disable-glut \
    --enable-32-bit \
    --libdir=/usr/lib32

  make
}

package() {
  cd build

  make DESTDIR=${pkgdir} install
  rm -rf ${pkgdir}/usr/include
  #install -m755 -d "${pkgdir}/usr/lib/xorg/modules/extensions"
  #ln -sf libglx.xorg ${pkgdir}/usr/lib/xorg/modules/extensions/libglx.so || return 1

  #install -m755 -d "${pkgdir}/usr/bin"
  #install -m755 progs/xdemos/glxinfo progs/xdemos/glxgears ${pkgdir}/usr/bin/
}
