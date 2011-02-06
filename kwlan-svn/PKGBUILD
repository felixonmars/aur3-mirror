# Contributor: Adam Russ <adam@russ.co.il>

pkgname=kwlan-svn
arch=('i686' 'x86_64')
pkgver=828857
pkgrel=1

pkgdesc="Kwlan for KDE4 - SVN version of the kde network / wifi manager"
url="http://www.kde.org"
license=('GPL')

depends=('kdebase-runtime' 'automoc4')
makedepends=('subversion' 'cmake')
provides=('kwlan' 'kwlan-svn')
conflicts=('kwlan')
source=()
md5sums=()


_svntrunk=svn://anonsvn.kde.org/home/kde/trunk/extragear/network/kwlan/
_svnmod=kwlan

build() {
	cd $startdir/src

	svn co $_svntrunk $_svnmod

	msg "SVN checkout done or server timeout"
	msg "Starting make..."

	cp -r $_svnmod $_svnmod-build
        cd $_svnmod-build
	
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=RELEASE

	make VERBOSE=1 || return 1
	make DESTDIR=$startdir/pkg install || return 1

	rm -rf $startdir/src/$_svnmod-build
}