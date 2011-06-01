# Contributor: Vladimir Ermakov <vooon341@gmail.com>
# Contributor: Alexander Lam <moar.spam.rite.nao <at> gmail <dot> com>

pkgname=player-svn
pkgver=9056
pkgrel=1
pkgdesc="Robotic systems environment"
arch=(i686 x86_64)
url='http://playerstage.sourceforge.net'
license=('GPL')
depends=('libgnomecanvas' 'libtool' 'boost-libs' 'gsl' 'opencv' 'python2')
makedepends=('cmake' 'swig' 'boost')
provides=('player')
conflicts=('player')

_svntrunk=http://playerstage.svn.sourceforge.net/svnroot/playerstage/code/player/trunk/
_svnmod=$pkgname

build() {
  cd $startdir/src

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"

  rm -rf $_svnmod-build
  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build

  unset MAKEFLAGS  #seems to have issues with multithreaded make

  msg "Starting CMake..."
  sed -i s/lib64/lib/ cmake/internal/SetupDirectories.cmake
  sed -i '1i #include <cstddef>' server/drivers/blobfinder/shapetracker/shapetracker.cc
  sed -i '1i #include <cstddef>' server/drivers/blobfinder/upcbarcode/upcbarcode.cc
  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_SKIP_BUILD_RPATH=TRUE
  make
}

package() {
  cd "${srcdir}/$_svnmod-build"

  make DESTDIR="${pkgdir}" install
}
# vim:set ts=2 sw=2 et:
