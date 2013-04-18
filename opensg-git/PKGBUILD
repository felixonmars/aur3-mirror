# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>

pkgname=opensg-git
_gitname=opensg
pkgver=20130410.2274334
pkgrel=1
pkgdesc="Open Source scene graph system for interactive 3D graphics applications"
arch=('i686' 'x86_64')
license=('LGPL')
url="http://www.opensg.org"
depends=('boost' 'freeglut' 'glu' 'mesa' 'openexr' 'python2' 'qt4')
makedepends=('git')
conflicts=('opensg-cvs')
options=('!docs')
source=('git://opensg.git.sourceforge.net/gitroot/opensg/opensg')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  
  git log -1 --format='%cd.%h' --date=short | tr -d - | sed 's/-/./'
}

build() {
  cd "${srcdir}/${_gitname}"
  
  mkdir build && cd build
    
  cmake .. \
  -DCMAKE_INSTALL_PREFIX=/usr \
  -DCMAKE_BUILD_TYPE=Release \
  -DOSG_ENABLE_C++11=ON \
  -DOSGBUILD_EXAMPLES_SIMPLE=ON \
  -DOSGBUILD_EXAMPLES_ADVANCED=ON \
  -DOSGBUILD_EXAMPLES_TUTORIAL=ON \
  -DOSG_INSTALL_EXAMPLES=ON \
  -DOSG_INSTALL_EXAMPLES_EXE=ON
  
  make
}

package() {
  cd "${srcdir}/${_gitname}/build"
  
  make DESTDIR="${pkgdir}/" install
  [ -d "${pkgdir}/usr/lib64" ] && mv "${pkgdir}/usr/lib64" "${pkgdir}/usr/lib" || true
  
  install -Dm644 "$pkgdir/usr/share/OpenSG/cmake/FindOpenSG.cmake" \
  "$pkgdir/usr/share/cmake-2.8/Modules/FindOpenSG.cmake"
  
  sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" "${pkgdir}/usr/bin/fcd2code/fcd2code"
  sed -i -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" "${pkgdir}/usr/bin/osg2-config"
}
