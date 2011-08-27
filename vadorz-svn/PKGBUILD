# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=vadorz-svn
pkgver=33
pkgrel=1
pkgdesc="An addicting ncurses space-invaders game."
arch=('i686' 'x86_64')
url="http://code.google.com/p/vadorz"
license=('BSD')
depends=('ncurses')
source=()
md5sums=()

_svntrunk=http://vadorz.googlecode.com/svn/trunk
_svnmod=vadorz

build() {
	cd $srcdir

	if [ -d $_svnmod/.svn ]; then
		(cd $_svnmod && svn up -r $pkgver)
	else
		svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
	fi

	msg "SVN checkout done or server timeout"
	msg "Starting make..."

	rm -rf $srcdir/$_svnmod-build
	cp -r $srcdir/$_svnmod $srcdir/$_svnmod-build
	cd $srcdir/$_svnmod-build

	gcc vadorz.c -O2 -lncurses -o vadorz
	mkdir -p $pkgdir/usr/bin/
	install -m755 vadorz $pkgdir/usr/bin/
}
