# Contributor: Frank Oosterhuis <frank@scriptzone.nl>
pkgname=osso-gwobex-svn
pkgver=8524
pkgrel=2
pkgdesc="This library is intended as a higher abstraction layer to OpenOBEX."
depends=('bluez-utils')
makedepends=('subversion')
replaces=()
conflicts=()
url="https://stage.maemo.org/svn/maemo/projects/connectivity/osso-gwobex/trunk/"
source=()
sha1sums=()
md5sums=()
arch=('i686')
license=('GPL')

_svnmod=osso-gwobex
_svntrunk=https://stage.maemo.org/svn/maemo/projects/connectivity/osso-gwobex/trunk

build() {
    cd $startdir/src
    msg "Connecting to $_svnmod SVN server...."
    svn co $_svntrunk $_svnmod -r $pkgver
	
    msg "SVN checkout done or server timeout"
	
    msg "Starting make..."
    cd osso-gwobex/
    
    ./autogen.sh --prefix=/usr
    make
    make DESTDIR=$startdir/pkg install
}


