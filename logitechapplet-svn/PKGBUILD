# Contributor: Lawrence Lee <valheru AT facticius DOT net>
pkgname=logitechapplet-svn
pkgver=10
pkgrel=1
pkgdesc="Frontend written in Qt4 for interfacing via DBUS with logitechdaemon."
arch=('i686' 'x86_64')
url="http://code.google.com/p/logitechapplet/"
license=('GPL')
depends=('qt4>=4.2' 'dbus')
makedepends=('cmake>=2.4' 'subversion')
source=()
md5sums=()

_svntrunk=http://logitechapplet.googlecode.com/svn/trunk/
_svnmod=logitechapplet

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

	cmake ../$_svnmod
	make DESTDIR=$startdir/pkg/ install

	rm -rf $startdir/src/$_svnmod-build
}

# vim:set ts=2 sw=2 et:
