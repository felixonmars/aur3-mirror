# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Antti Oja <antti.bofh@gmail.com>
# Contributor: Perry3D <perry3d@gmail.com>
pkgname=libgl-git-gallium
pkgver=20100817
pkgrel=1
pkgdesc='Gallium3D-enabled Mesa 3-D graphics library and DRI software rasterizer from the git master branch.'
arch=('i686' 'x86_64')
license=('LGPL')
url='http://mesa3d.sourceforge.net'
depends=('libdrm-git' 'libxxf86vm' 'libxdamage' 'expat>=2.0.1')
makedepends=('dri2proto-git' 'glproto-git' 'pkgconfig')
provides=('libgl=7.8.2' 'libgl-git')
conflicts=('libgl' 'libgl-git')
options=('!makeflags')
source=('dricore.patch')
md5sums=('aa670275c70ee8d1b463aef4c23a0819')

_gitroot='git://anongit.freedesktop.org/git/mesa/mesa'
_gitname='mesa'

build() {
  msg 'Connecting to git.freedesktop.org GIT server....'

  if [ -d ${_gitname} ]; then
    cd ${_gitname} && git pull origin
    msg 'The local files are updated.'
  else
    git clone ${_gitroot}
  fi

  msg 'GIT checkout done or server timeout'
  msg 'Starting make...'

  cd ${srcdir}

  [ -d ${_gitname}-build ] && rm -rf ${_gitname}-build
  cp -r ${_gitname} ${_gitname}-build
  cd ${_gitname}-build

  #patch -Np1 -i ${srcdir}/dricore.patch

  ./autogen.sh \
    --prefix=/usr \
    --with-dri-driverdir=/usr/lib/xorg/modules/dri \
    --with-dri-drivers=swrast \
    --enable-glx-tls \
    --with-driver=dri \
    --enable-xcb \
    --disable-egl \
    --disable-glu \
    --disable-glut \
    --disable-glw \
    --enable-gallium \
    --enable-gallium-swrast

  make
}

package() {
  cd ${_gitname}-build

  make DESTDIR=${pkgdir} install

  rm -f ${pkgdir}/usr/lib/libEGL.so*
  rm -rf ${pkgdir}/usr/include
  rm -rf ${pkgdir}/usr/lib/pkgconfig
  install -d ${pkgdir}/usr/lib/xorg/modules/extensions
  ln -sf libglx.xorg ${pkgdir}/usr/lib/xorg/modules/extensions/libglx.so

  cd ${srcdir}/mesa-build/src/mesa/drivers/dri
  make -C swrast DESTDIR=${pkgdir} install
  #install -m644 libdricore.so ${pkgdir}/usr/lib/xorg/modules/dri/
}
