# MSyncTool Subversion Package
# Contributor: Juanma Hernández <juanmah@gmail.com>

pkgname=msynctool-svn
pkgver=380
pkgrel=1
pkgdesc="CLI interface to the opensync synchronization framework"
url="http://www.opensync.org/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libopensync-svn')
makedepends=('subversion')
provides=('msynctool')
conflicts=('msynctool')
source=()
md5sums=()

_svnmod="multisync"
_svntrunk="http://svn.opensync.org/multisync/trunk"

build() {

  cd $startdir/src

  svn co $_svntrunk $_svnmod --config-dir -/ -r $pkgver

  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build

  mkdir build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
  make || return 1
  make DESTDIR=$pkgdir install


  rm -rf ../$_svnmod-build

}
