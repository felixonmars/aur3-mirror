#Contributor: Birger Moellering <bmoellering@googlemail.com>
pkgname=whiteboard-svn
arch=('i686' 'x86_64')
url="http://linux-whiteboard.googlecode.com"
license="GPL2"
pkgver=152
pkgrel=6
pkgdesc="whiteboard-svn is built of the latest linux-whiteboard source available"

depends=('libglademm' 'cwiid' 'libxtst')
provides=('whiteboard')
makedepends=('scons')


install=whiteboard.install
source=()

_svntrunk=http://linux-whiteboard.googlecode.com/svn/trunk/
_svnmod=whiteboard
md5sums=()

build() {
	cd $srcdir
	svn co $_svntrunk --config-dir ./$_svnmod

	msg "SVN checkout done or server timeout"
	msg "Starting scons..."

	cd $srcdir/trunk

	scons PREFIX=/usr DESTDIR=$pkgdir
	scons install
}
