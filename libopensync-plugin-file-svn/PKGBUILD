# Maintainer: Samuele Disegna <smldis@gmail.com>

pkgname=libopensync-plugin-file-svn
pkgver=5603
pkgrel=1
pkgdesc="File plugin for OpenSync"
arch=('i686' 'x86_64')
url="http://www.opensync.org"
license=('LGPL2')
depends=('libopensync-svn')
makedepends=('subversion' 'cmake')
provides=('libopensync-plugin-file')
conflicts=('libopensync-plugin-file')
source=()
md5sums=()

_svnmod="libopensync-plugin-file"
_svntrunk="http://svn.opensync.org/plugins/file-sync/"

build() {
  cd $startdir/src
  msg "Connecting to $_svntrunk SVN server...."
  svn co $_svntrunk $_svnmod -r $pkgver 

  [ -d ./$_svnmod-build ] && rm -fr ./$_svnmod-build
  cp -r ./$_svnmod ./$_svnmod-build
  cd ./$_svnmod-build
  
  msg "SVN checkout done or server timeout"
  msg "Starting cmake..."

  mkdir build
  cd build
  cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr || return 1
  make || return 1
  make DESTDIR=$pkgdir install || return 1

  rm  -rf  $startdir/src/$_svnmod-build
}
 
