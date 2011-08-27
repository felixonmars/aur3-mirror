# Contributor: Massimiliano Torromeo <Massimiliano DOT Torromeo AT gmail DOT com>
pkgname=kregexpeditor-svn

_svntrunk=svn://anonsvn.kde.org/home/kde/trunk/playground/utils/kregexpeditor/
_svnmod=kregexpeditor

pkgver=1218601
pkgrel=2
pkgdesc="KDE editor for regular expressions"
arch=(i686 x86_64)
url="http://websvn.kde.org/trunk/playground/utils/kregexpeditor/"
license=('GPL')
depends=('kdebase-runtime')
makedepends=('subversion' 'cmake' 'automoc4')
install=$_svnmod.install

build() {
	cd $srcdir
	if [ -d $_svnmod/.svn ]; then
		(cd $_svnmod && svn up)
	else
		svn co $_svntrunk $_svnmod
	fi

	msg "SVN checkout done or server timeout"
	msg "Starting make..."

	rm -rf $_svnmod-build
	mkdir $_svnmod-build
	cd $_svnmod-build

	cmake $srcdir/$_svnmod \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release
	make
}

package() {
	cd "$srcdir/$_svnmod-build"
	make DESTDIR="$pkgdir" install
}
