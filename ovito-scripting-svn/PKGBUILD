# Maintainer: Jan Oliver Oelerich <janoliver@oelerich.org> 
pkgname=ovito-scripting-svn
pkgver=20130312
pkgrel=2
pkgdesc="Ovito compiled from source with python scripting support"
arch=('i686' 'x86_64')
url="http://www.ovito.org/"
license=('GPLv3')
depends=('python2' 'zlib' 'boost')
makedepends=('svn' 'cmake' 'gcc')
conflicts=('ovito')
source=('zlib.patch')
md5sums=('4fa7b3f44486e7dbcca4d7084bdf8346')

_svnroot="http://ovito.svn.sourceforge.net/svnroot/ovito/trunk/"
_svnsrcdir="source"

build() {
  cd "$srcdir"
  mkdir -p build

  msg "Connecting to SVN server...."

  if [ -d $_svnsrcdir ] ; then
    cd $_svnsrcdir && svn update
    msg "The local files are updated."
  else
    svn checkout $_svnroot $_svnsrcdir
    cd $_svnsrcdir
  fi

  msg "SVN checkout done or server timeout"
  msg "applying patch"
  
  patch -p0 < $startdir/zlib.patch

  msg "building"
  cd "$srcdir/build"

  cmake ../source -DCMAKE_BUILD_TYPE=release \
                  -DOVITO_BUILD_PLUGIN_SCRIPTING=ON \
                  -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 \
                  -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so \
                  -DCMAKE_INSTALL_PREFIX:PATH=$pkgdir/usr
  make
}

package() {
  cd "$srcdir/build"
  make install

  cd "$srcdir/source/src/atomviz/resources/scripts"
  install -D -m644 ./*.py ${pkgdir}/usr/share/ovito/scripts/atomviz/
} 
