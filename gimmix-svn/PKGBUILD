# Contributor: Priyank Gosalia <priyankmg@gmail.com>

pkgname=gimmix-svn
pkgver=518
pkgrel=1
pkgdesc="graphical MPD client written in C using GTK+2 (svn version)"
url="http://gimmix.berlios.de/"
license="GPL"
depends=('libglade>=2.6.0' 'libmpd>=0.15.0' 'taglib' 'libnxml' 'curl')
makedepends=('subversion')
conflicts=('gimmix')
provides=('gimmix')
source=()
arch=('i686' 'x86_64')
md5sums=()

_svntrunk=http://svn.berlios.de/svnroot/repos/gimmix/trunk
_svnmod=gimmix

build() {
	cd $startdir/src

	svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod

	msg "SVN checkout done or server timeout"
	msg "Starting make..."

	# Install
	cd $_svnmod/src
	sh autogen.sh
	./configure --prefix=/usr --enable-cover --enable-lyrics
	make || return 1
	make DESTDIR=$startdir/pkg install
}

