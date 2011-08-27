# Contributor: Lawrence Lee <valheru AT facticius DOT net>
pkgname=logitechdaemon-svn
pkgver=28
pkgrel=1
pkgdesc="A daemon to control the advanced functions of the Logitech G15 keyboard and the MX Revolution mouse via a DBUS interface"
arch=('i686' 'x86_64')
url="http://code.google.com/p/logitechdaemon/"
license=('GPL')
depends=('glib2' 'libg15render' 'dbus-glib' 'libdaemon')
makedepends=('cmake>=2.4' 'subversion')
source=()
md5sums=()

_svntrunk=http://logitechdaemon.googlecode.com/svn/trunk/
_svnmod=logitechdaemon

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

	cmake ../$_svnmod -DCOMPILE_C_VERSION=1
	make DESTDIR=$startdir/pkg/ install

	rm -rf $startdir/src/$_svnmod-build
}

# vim:set ts=2 sw=2 et:
