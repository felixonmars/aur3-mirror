# Maintainer: Samuele Disegna <smldis@gmail.com>

pkgname=libopensync-plugin-evolution2-svn
pkgver=5567
pkgrel=1
pkgdesc="Evolution plugin for OpenSync"
arch=('i686' 'x86_64')
url="http://www.opensync.org"
license=('LGPL2')
depends=('libopensync-svn')
optdepends=('evolution-data-server')
makedepends=('subversion' 'cmake')
provides=('libopensync-plugin-evolution2')
conflicts=('libopensync-plugin-evolution2')
source=()
md5sums=()

_svnmod="libopensync-plugin-evolution2"
_svntrunk="http://svn.opensync.org/plugins/evolution2/"

build() {
  cd $startdir/src
  msg "Connecting to $_svnmod...."
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
 
