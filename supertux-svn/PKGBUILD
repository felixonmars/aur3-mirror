# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Original Maintainer: Hakim <acrox999 at gmail dot com>
# Contributor: Patrick Bartels <p4ddy.b@gmail.com>
pkgname='supertux-svn'
pkgver=6694
pkgrel=1
pkgdesc="A classic 2D jump'n run sidescroller game in a style similar to the original SuperMario game"
url='http://super-tux.sourceforge.net'
license=('GPL')
arch=('i686' 'x86_64')
depends=('sdl_image' 'physfs' 'openal' 'libvorbis' 'curl' 'boost' 'glew')
makedepends=('subversion' 'cmake')
conflicts=('supertux')
provides=('supertux')

_svntrunk='http://supertux.lethargik.org/svn/supertux/trunk/supertux'
_svnmod='supertux'

build() {
  cd "${srcdir}"
  msg "Connecting to SVN server...."

  if [[ -d "${_svnmod}/.svn" ]]; then
    (cd "${_svnmod}" && svn up -r "${pkgver}")
  else
    svn co "${_svntrunk}" --config-dir ./ -r "${pkgver}" "${_svnmod}"
  fi
  
  msg 'SVN checkout done or server timeout'
  msg 'Starting build...'

  rm -rf "${srcdir}/${_svnmod}-build"
  cp -r "${srcdir}/${_svnmod}" "${srcdir}/${_svnmod}-build"
  cd "${srcdir}/${_svnmod}-build"

  sed -i '/curl\/types.h/d' src/addon/addon_manager.cpp
  sed -i '1i#include <cstddef>' src/supertux/screen_manager.hpp  
  cmake -D CMAKE_INSTALL_PREFIX=/usr -D INSTALL_SUBDIR_BIN=bin .
}

package() {
  cd "${srcdir}/${_svnmod}-build"
  make ${MAKEFLAGS}
  make DESTDIR="${pkgdir}/" install
}
