# Contributor : eduard_pustobaev <eduard_pustobaev@mail.ru>

pkgname=lightlang-svn
pkgver=497
pkgrel=1
pkgdesc="LightLang - system of electronic dictionaries for Linux."
arch=('i686' 'x86_64')
url="http://lightlang.org.ru/"
license="GPL"
depends=('qt' 'pyqt' 'python-xlib' 'sox')
makedepends=('subversion')
provides=('lightlang')
source=()
md5sums=()

_svnmod=lightlang
_svntrunk=http://lightlang.googlecode.com/svn/trunk/lightlang


build() {
	cd $startdir/src
	if [ -d $_svnmod/.svn ]; then
		(cd $_svnmod && svn up -r $pkgver)
	else
		svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
	fi

	msg "SVN checkout done or server timeout"
	msg "Starting make..."
	
	rm -r $_svnmod-build
	cp -r $_svnmod $_svnmod-build
	cd $_svnmod-build
	
	./configure || return 1
	make || return 1
	make DESTDIR=$pkgdir install
}
