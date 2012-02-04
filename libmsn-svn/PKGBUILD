# Contributor: Charly Ghislain <charlyghislain@gmail.com>
pkgname=libmsn-svn
pkgver=96
pkgrel=1
pkgdesc="A reusable, open-source, fully documented library for connecting to Microsoft's MSN"
url="http://sourceforge.net/projects/libmsn/"
license=('GPL2')
makedepends=('cmake' 'subversion')
depends=('openssl' 'gcc-libs')
source=()
provides=('libmsn')
conflicts=('libmsn')
md5sums=()
arch=('i686' 'x86_64')

_svntrunk="https://libmsn.svn.sourceforge.net/svnroot/libmsn"
_svnmod="libmsn"

build() {
 cd $startdir/src
 msg "Connecting to SVN server...."
 if [ -d $_svnmod/.svn ]; then
   (cd $_svnmod && svn up -r $pkgver)
   else
   svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
 fi
 msg "SVN checkout done or server timeout"
 msg "Starting make..."
 svn export $_svnmod $_svnmod-build
 cd $_svnmod-build
 cd trunk
 mkdir build
 cd build
 #cmake -DCMAKE_CXX_FLAGS=-DDEBUG -D CMAKE_INSTALL_PREFIX=/usr ..
 cmake  -DCMAKE_INSTALL_PREFIX=/usr ..
 make DESTDIR=$startdir/pkg install
}
