# Contributor:  Flexoid <flexoid@gmail.com>
# Contributor:  Dany Martineau <dany.luc.martineau at gmail.com>
# Maintainer:   Chris Heien <chris.h.heien@gmail.com>

pkgname=libface-svn
pkgver=271
pkgrel=1
pkgdesc="Face recognition library. SVN Version"
arch=('i686' 'x86_64')
url="http://libface.sourceforge.net/"
license=('GPL')
depends=('opencv>=2.1')
makedepends=('subversion' 'cmake' 'pkgconfig')
conflicts=('libface')
provides=('libface')

_svntrunk='https://libface.svn.sourceforge.net/svnroot/libface/trunk'
_svnmod=libface

build() {
  cd $srcdir
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up)
  else
    svn co $_svntrunk $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."
  if [[ -d ${srcdir}/${_svnmod}-build ]]; then
    msg "Cleaning the previous build directory..."
    rm -rf ${srcdir}/${_svnmod}-build
  fi 

  mkdir $_svnmod-build
  cd $_svnmod-build
  cmake $startdir/src/$_svnmod -DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_SKIP_RPATH=ON \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DLIB_INSTALL_DIR=lib
  make
}

package() {
  cd ${srcdir}/$_svnmod-build
  make DESTDIR=${pkgdir} install
}
		