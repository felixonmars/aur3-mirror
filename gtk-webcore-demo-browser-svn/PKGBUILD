# Contributor: Tom Elliott (amusing.name.here@gmail.com)

pkgname=gtk-webcore-demo-browser-svn
pkgver=125
pkgrel=1
pkgdesc="A example browser using gtk-webcore."
url="http://gtk-webcore.sourceforge.net/"
arch=(i686 x86_64)
license=('GPL')
#depends=('libglade' 'libxml2' 'gtk-webcore-nrcit-svn')
makedepends=('subversion' 'autoconf' 'automake' 'libtool')
replaces=('osb-browser-svn')
source=()
md5sums=()

_svntrunk=https://gtk-webcore.svn.sourceforge.net/svnroot/gtk-webcore/trunk/osb-browser/
_svnmod=demo-browser

build() {
	cd $startdir/src

	svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod

	msg "SVN checkout done or server timeout"
	msg "Starting make..."

	# Install
	cd $_svnmod/
	sh autogen.sh
	./configure --prefix=/usr
	make || return 1
	make DESTDIR=$startdir/pkg install
}

