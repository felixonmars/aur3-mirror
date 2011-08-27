# Contributor: Tom Elliott (amusing.name.here@gmail.com)

pkgname=gtk-webcore-nrcit-svn
pkgver=123
pkgrel=2
pkgdesc="A embeddable web component using gtk-webcore"
url="http://gtk-webcore.sourceforge.net/"
arch=(i686 x86_64)
license=('GPL')
depends=('gtk-webcore-nrcore-svn' 'curl')
makedepends=('subversion' 'autoconf' 'automake' 'libtool')
replaces=('osb-nrcit-svn')
source=()
md5sums=()

_svntrunk=https://gtk-webcore.svn.sourceforge.net/svnroot/gtk-webcore/trunk/NRCit/
_svnmod=nrcit

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

