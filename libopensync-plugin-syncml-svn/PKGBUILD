# Maintainer: Samuele Disegna <smldis@gmail.com>

pkgname=libopensync-plugin-syncml-svn
pkgver=5954
pkgrel=1
pkgdesc="Syncml plugin for OpenSync"
arch=('i686' 'x86_64')
url="http://www.opensync.org"
license=('LGPL2')
depends=('libopensync-svn' 'libsyncml-svn')
makedepends=('subversion' 'cmake')
provides=('libopensync-plugin-syncml')
conflicts=('libopensync-plugin-syncml')
source=()
md5sums=()

_svnmod="libopensync-plugin-syncml"
_svntrunk="http://svn.opensync.org/plugins/syncml/trunk"

build() {
  cd $startdir/src
  msg "Connecting to $_svntrunk SVN server...."
  svn co $_svntrunk $_svnmod -r $pkgver 

  [ -d ./$_svnmod-build ] && rm -fr ./$_svnmod-build
  cp -r ./$_svnmod ./$_svnmod-build
  cd ./$_svnmod-build
  
  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  mkdir build
  cd build
  cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr || return 1
  make || return 1
  make DESTDIR=$pkgdir install || return 1

  rm  -rf  $startdir/src/$_svnmod-build
}
 
