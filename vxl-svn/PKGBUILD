# Contributor: Muhammad Qadri <maqadriatcomcastdotnet>
pkgname=vxl-svn
pkgver=26161
pkgrel=1
pkgdesc="Collection of C++ libraries designed for computer vision research and implementation"
arch=('i686' 'x86_64')
url="http://vxl.sourceforge.net"
license=('custom:BSD')
makedepends=('subversion' 'cmake')
provides=('vxl')
conflicts=('vxl')
source=()
md5sums=() 

_svntrunk=https://vxl.svn.sourceforge.net/svnroot/vxl/trunk
_svnmod=vxl

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  #Note that we don't copy the code from directory to the next
  #This is because the cmake utility doesn't work with the sed patch that way
  rm -rf "$srcdir/$_svnmod-build"
  mkdir "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  sed -e 's| mpeg2 | mpeg2vxl |' "$srcdir/$_svnmod/v3p/mpeg2/CMakeLists.txt" "$srcdir/$_svnmod/config/cmake/Modules/FindMPEG2.cmake" -i 

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_SHARED_LIBS:BOOL=ON -DBUILD_TESTING:BOOL=OFF -DCMAKE_CXX_FLAGS="$CXXFLAGS" -DCMAKE_C_FLAGS="$CFLAGS" "$srcdir/$_svnmod"

  make || return 1
  make DESTDIR="$pkgdir/" install

  profile_entry=$srcdir/vxl.sh
  echo '#!/bin/sh' > $profile_entry
  echo 'export VXLDIR=/usr' >> $profile_entry

  install -Dm644 $srcdir/$_svnmod/core/vxl_copyright.h $pkgdir/usr/share/licenses/$pkgname/vxl_copyright.h
  install -Dm755 $profile_entry $pkgdir/etc/profile.d/opengazer.sh
}
