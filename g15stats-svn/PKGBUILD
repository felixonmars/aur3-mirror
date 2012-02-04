pkgname=g15stats-svn
pkgver=539
pkgrel=1
pkgdesc="A CPU/Mem/Swap/Network monitoring client for G15Daemon."
arch=(x86_64)
url="http://g15tools.sourceforge.net/"
license=('GPL')
depends=(libg15-svn libg15render-svn g15daemon-svn libgtop)
makedepends=('subversion')
source=()

_svntrunk=https://g15daemon.svn.sourceforge.net/svnroot/g15daemon/trunk/g15daemon-clients/g15stats
_svnmod=g15stats

build() {
  svn co $_svntrunk
  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cd ${srcdir}/$_svnmod
  ./autogen.sh
  ./configure --prefix=/usr
  /usr/bin/make || return 1
  /usr/bin/make DESTDIR=$startdir/pkg install
}
