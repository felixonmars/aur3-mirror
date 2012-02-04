# Contributor: Carlo Casta <carlo.casta at gmail dot com>
pkgname=qcodeedit-svn
pkgver=1053
pkgrel=1
pkgdesc="A Qt4 component for text / source code editing"
arch=('i686' 'x86_64')
url="http://qcodeedit.edyuk.org"
license=('GPL')
depends=('qt')
source=()
md5sums=()

# svn addr
_svntrunk=http://edyuk.svn.sf.net/svnroot/edyuk/trunk/3rdparty/qcodeedit2

build()
{
	cd $startdir/src/
	svn co $_svntrunk $pkgname -r $pkgver
	msg "SVN checkout done or server timeout"

	cd $startdir/src/$pkgname

	qmake || return 1
	make || return 1

	# second run of qmake, needed for lib directory to be installed correctly
	qmake || return 1
	make INSTALL_ROOT=$startdir/pkg install || return 1

	# recreate broken symlinks
	cd $startdir/pkg/usr/lib
	ln -sf libqcodeedit.so.1.0.0 libqcodeedit.so
	ln -sf libqcodeedit.so.1.0.0 libqcodeedit.so.1
	ln -sf libqcodeedit.so.1.0.0 libqcodeedit.so.1.0
}
