# Contributor: Lawrence Lee <valheru@facticius.net>
pkgname=kdegames4-svn
pkgver=1236525
pkgrel=1
pkgdesc="Games for KDE4"
arch=('i686' 'x86_64')
url="http://www.kde.org"
license=('GPL')
depends=('kdebase4-runtime-git' 'openal' 'kdebindings-python' 'twisted' 'ggz-client-libs')
makedepends=('subversion' 'cmake' 'automoc4')
conflicts=('kdegames')
groups=('kde4-git')
install="kdegames4-svn.install"

_svntrunk=svn://anonsvn.kde.org/home/kde/trunk/KDE/kdegames
_svnmod=kdegames

build() {
  cd $srcdir
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up)
  else
    svn co $_svntrunk $_svnmod
  fi
  msg "SVN checkout done or server timeout"
  msg "Starting make..."
  if [[ -d ${srcdir}/build ]]; then
    msg "Cleaning the previous build directory..."
    rm -rf ${srcdir}/build
  fi 

  mkdir ${srcdir}/build
  cd ${srcdir}/build
  cmake $startdir/src/$_svnmod -DCMAKE_BUILD_TYPE=debugfull \
		-DCMAKE_SKIP_RPATH=ON \
		-DCMAKE_INSTALL_PREFIX=/usr 
  make
}

package() {
  cd ${srcdir}/build
  make DESTDIR=${pkgdir} install
  find "${pkgdir}" -name '*.py' | xargs sed -i 's|#!/usr/bin/env python|#!/usr/bin/env python2|'
}