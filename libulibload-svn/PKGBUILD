pkgname=libulibload-svn
pkgver=11
pkgrel=3
pkgdesc="A library to load dynamic linked objects, like dlopen or LoadLibrary."
arch=('i686' 'x86_64')
url="http://code.google.com/p/ulibload/"
license=('LGPL')
depends=()
makedepends=('gcc' 'subversion' 'cmake')
options=()
conflicts=('libulibload')
provides=('libulibload')
source=()
md5sums=()

_svntrunk=https://ulibload.googlecode.com/svn/trunk/
_svnmod=ulibload

build() {

	cd $startdir/src

	if [ -d $_svnmod/.svn ]; then
		(cd ulibload && svn up -r $pkgver)
	else
		svn co $_svntrunk -r $pkgver $_svnmod
	fi

	msg "SVN checkout done or server timeout"
	msg "Starting make..."


	mkdir ulibload-build
	cd ulibload-build

	cmake -DCMAKE_INSTALL_PREFIX=/usr ../$_svnmod/ulibload
	make || return 1
	make DESTDIR=$startdir/pkg/ install

	rm -rf $startdir/src/ulibload-build

}
