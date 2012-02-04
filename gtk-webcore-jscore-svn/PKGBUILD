# Contributor: Tom Elliott (amusing.name.here@gmail.com)

pkgname=gtk-webcore-jscore-svn
pkgver=117
pkgrel=3
pkgdesc="A javascript interpreter for gtk-webcore."
url="http://gtk-webcore.sourceforge.net/"
arch=(i686 x86_64)
license=('GPL')
depends=('gtk2')
makedepends=('subversion' 'autoconf' 'automake' 'libtool')
replaces=('osb-jscore-svn')
conflicts=('osb-jscore-svn')
source=()
md5sums=()

_svntrunk=https://gtk-webcore.svn.sourceforge.net/svnroot/gtk-webcore/trunk/JavaScriptCore/
_svnmod=jscore

build() {
	cd $startdir/src

	svn co $_svntrunk --config-dir ./ $_svnmod

	msg "SVN checkout done or server timeout"
	msg "Starting make..."

	# Install
	cd $_svnmod/
	sh autogen.sh
	./configure --prefix=/usr
	make || return 1
	make DESTDIR=$startdir/pkg install
}

