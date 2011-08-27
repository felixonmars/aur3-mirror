# Maintainer: Gunnar Kriik <gunnar.kriik@gmail.com>
# Contributor: krigun

pkgname=recastnavigation-svn
pkgrel=1
pkgver=141
pkgdesc="Navigation-mesh Construction Toolset for Games"
arch=('i686' 'x86_64')
url="http://code.google.com/p/recastnavigation"
license=('MIT')
groups=()
depends=('sdl')
makedepends=('subversion' 'cmake' 'sdl')

source=('cmake.patch')
md5sums=('e82b8e968a30eb5cf3f63bb50f2f9158')

_svntrunk="http://recastnavigation.googlecode.com/svn/trunk"
_svnmod=recastnavigation-svn

build() {
  cd ${srcdir} || return 1

  # Checkut from SVN
  if [ -d ${_svnmod}/.svn ]; then
    (cd ${_svnmod} && svn up)
  else
    svn co -r ${pkgver} ${_svntrunk} ${_svnmod}
  fi

  cd ${_svnmod}

  # Patch that creates a set of CMake build files
  patch -p1 < ../cmake.patch
  mkdir build ; cd build/

  # Build the libraries and the demo app
  cmake .. ; make || return 1
  
  # Create package directory structure
  mkdir -p $pkgdir/usr/include
  mkdir -p $pkgdir/usr/lib
  mkdir -p $pkgdir/usr/share/recastnavigation

  # Copy shared libraries
  cp bin/libRecast.so $pkgdir/usr/lib
  cp bin/libDetour.so $pkgdir/usr/lib
  cp bin/libDebugUtils.so $pkgdir/usr/lib

  # Copy headers
  cp ${srcdir}/${_svnmod}/Recast/Include/* $pkgdir/usr/include
  cp ${srcdir}/${_svnmod}/Detour/Include/* $pkgdir/usr/include
  cp ${srcdir}/${_svnmod}/DebugUtils/Include/* $pkgdir/usr/include

  # Copy demo application to "/usr/share/recastnavigation"
  mkdir -p $pkgdir/usr/share/recastnavigation
  cp bin/RecastDemo $pkgdir/usr/share/recastnavigation
  cp bin/DroidSans.ttf $pkgdir/usr/share/recastnavigation/DroidSans.ttf
  cp bin/test.chf $pkgdir/usr/share/recastnavigation/test.chf
  cp -R bin/Meshes $pkgdir/usr/share/recastnavigation/Meshes
  cp -R bin/Tests $pkgdir/usr/share/recastnavigation/Tests
}
