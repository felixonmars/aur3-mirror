# Contributor: Lawrence Lee <valheru AT facticius DOT net>
pkgname=kpar2-svn
pkgver=16
pkgrel=1
pkgdesc="PAR2 verification and repair program for KDE3"
arch=('i686' 'x86_64')
url="http://code.google.com/p/kpar2/"
license=('GPL')
depends=('kdelibs' 'libpar2')
makedepends=('cmake>=2.4' 'subversion')
conflicts=(kpar2)
provides=(kpar2)
source=()
md5sums=()
_svntrunk=http://kpar2.googlecode.com/svn/trunk/
_svnmod=kpar2

build() {

	cd $startdir/src

	if [ -d $_svnmod/.svn ]; then
		(cd $_svnmod && svn up -r $pkgver)
	else
		svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
	fi

	msg "SVN checkout done or server timeout"
	msg "Starting make..."

	cp -r $_svnmod $_svnmod-build
	cd $_svnmod-build
	cmake $startdir/src/$_svnmod -DCMAKE_INSTALL_PREFIX=${KDEDIR}
	make DESTDIR="$startdir/pkg" install

	rm -rf $startdir/src/$_svnmod-build
}

# vim:set ts=2 sw=2 et:
