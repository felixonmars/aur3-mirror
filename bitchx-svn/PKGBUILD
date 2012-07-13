# Contributor: wodim <neikokz@gmail.com>

pkgname=bitchx-svn
pkgver=1
pkgrel=1
pkgdesc="Open source IRC client, considered to be the most popular ircII-based IRC client"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/bitchx/"
license="GPL2"
depends=('ncurses')
makedepends=('subversion' 'cpio')
conflicts=('ircii-pana')
provides=()
source=()
md5sums=()

_svntrunk=https://bitchx.svn.sourceforge.net/svnroot/bitchx/trunk
_svnmod=bitchx

build() {
	cd $startdir/src

	# Get Latest Source Code
	svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod

	msg "SVN checkout done or server timeout"
	msg "Starting make..."

	# Install
	cd $_svnmod
	./configure --prefix=$startdir/pkg/usr || return 1
	make || return 1
	make install || return 1
}
