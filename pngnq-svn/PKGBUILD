# chen bin <chenbin.sh AT gmail DOT com>
pkgname=pngnq-svn
pkgver=20080502
pkgrel=1
pkgdesc="A tool for quantizing PNG images in RGBA format - svn version" 
arch=('i686' 'x86_64')
url="http://pngnq.sourceforge.net/"
source=(pngnq.desktop)
license=('Attribution-Noncommercial-Share Alike 2.5 Australia')
depends=('zlib' 'libpng')
makedepends=('subversion')
provides=('pngnq')
conflicts=('pngnq')
replaces=('pngnq-svn')
md5sums=()
_svnmod="pngnq"
_svntrunk="https://pngnq.svn.sourceforge.net/svnroot/pngnq"
build() {
	cd $startdir/src
	mkdir -p ~/.subversion; touch ~/.subversion/servers
	msg "Connecting to $_svnmod.sourceforge.net SVN server...."
	svn co $_svntrunk $_svnmod

	msg "SVN checkout done or server timeout"
	msg "Starting make..."

	cd $_svnmod
	ln -sf `\ls /usr/share/automake*/install-sh` install-sh
	ln -sf `\ls /usr/share/automake*/missing` missing
	ln -sf `\ls /usr/share/automake*/depcomp` depcomp
	./configure --prefix=/usr
	msg "Starting build process."
	make || return 1
	mkdir -p $startdir/pkg/usr/bin/
	cp pngcomp $startdir/pkg/usr/bin/pngcomp
	cp pngnq $startdir/pkg/usr/bin/pngnq
}
