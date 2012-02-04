pkgname=juffed-svn
pkgver=1140
pkgrel=1
pkgdesc="JuffEd is a free, cross-platform text editor.This package also includes plugins"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/juffed"
license=('GPL2')
makedepends=('cmake' 'subversion')
depends=('qt' 'qscintilla')
provides=('juffed' 'juffed-plugins')
conflicts=('juffed' 'juffed-plugins')

_svntrunk="https://juffed.svn.sourceforge.net/svnroot/juffed/trunk/"
_svnmod="juffed"

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
  cmake $startdir/src/$_svnmod -DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DBUILD_TODOLIST:BOOL="1"
  make
}

package() {
  cd ${srcdir}/build
  make DESTDIR=${pkgdir} install
}