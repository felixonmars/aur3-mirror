# Contributor: Danilo T. <tillocad@libero.it>
# ------------------------------------------
# Build: ddclient-gui
 
pkgname=downloaddaemon-svn-client-gui
pkgver=1305
pkgrel=1
pkgdesc="Qt-gui remote front-end for DownloadDaemon"
arch=('i686' 'x86_64' 'arm')
url="http://downloaddaemon.sourceforge.net/"
license=('GPL')
depends=('gcc-libs' 'glibc' 'qt4' 'boost')
#conflicts=('ddclient-gui')
makedepends=('subversion' 'cmake')

_svntrunk="https://downloaddaemon.svn.sourceforge.net/svnroot/downloaddaemon/trunk/"
_svnmod="dd"

build() {

cd $startdir/src
mkdir -p ~/.subversion

svn co $_svntrunk $_svnmod
msg "SVN checkout done or server timeout"

msg "Starting make: ddclient-gui..."
cd "$srcdir/$_svnmod/src/ddclient-gui"
cmake . -DCMAKE_INSTALL_PREFIX=/usr -DUSE_STD_THREAD=0 -DCMAKE_CXX_LINK_FLAGS:STRING="-lboost_system"

}

package() {

  msg "Build: ddclient-gui..." 
  cd "$srcdir/$_svnmod/src/ddclient-gui"
  make DESTDIR=${pkgdir} install
}
