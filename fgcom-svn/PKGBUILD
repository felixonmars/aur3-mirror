# Maintainer: Nicola Bignami

pkgname=fgcom-svn
pkgver=20111113
pkgrel=2
pkgdesc="Realtime voice communications for FlightGear"
arch=('i686' 'x86_64')
url="http://fgms.sourceforge.net"
license=('GPL')
depends=('openal' 'zlib' 'alsa-lib' 'gcc-libs')
makedepends=('svn' 'simgear' 'sed' 'plib')
provides=('fgcom')
conflicts=('fgcom')

_svnroot="https://appfgcom.svn.sourceforge.net/svnroot/fgcom/trunk"
_svnname="fgcom"

build() {
  cd "$srcdir"
  msg "Connecting to SVN server...."

  if [ -d $_svnname ] ; then
    cd $_svnname && svn update
    msg "The local files are updated."
  else
    svn co $_svnroot $_svnname
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  chmod a+rw "$srcdir/$_svnname/src" -R
  cd "$srcdir/$_svnname/src"
  sed -i 's@usr/local@usr@' Makefile
  sed -i 's@INSTALL_BIN := /usr/bin@INSTALL_BIN:=$(DESTDIR)/usr/bin@' Makefile
  sed -i 's@INSTALL_DIR := /usr/fgcom@INSTALL_DIR:=$(DESTDIR)/usr/lib/fgcom@' Makefile
  make
}

package() {
  cd "$srcdir/$_svnname/src"
  mkdir $pkgdir/usr
  mkdir $pkgdir/usr/bin
  mkdir $pkgdir/usr/lib
  mkdir $pkgdir/usr/lib/fgcom
  make DESTDIR="$pkgdir" install
}
 
