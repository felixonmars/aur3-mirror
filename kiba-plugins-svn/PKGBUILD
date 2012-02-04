# Contributor: sickhate <vivid@tux-linux.net>

pkgname=kiba-plugins-svn
pkgver=862
pkgrel=3
pkgdesc="plugin set for kibadock"
arch=(i686 , x86_64)
url="http://www.kiba-dock.org/"
license=('GPL')
depends=('alsa-lib' 'gnome-vfs' 'libgtop'  'kiba-dock-svn')
makedepends=('subversion' 'pkgconfig' 'kiba-dock-svn')
options=('!libtool')
conflicts=('kibaplugins' ' kiba-plugins')
provides=('kiba-plugins')
source=()
md5sums=()

_svntrunk=https://kibadock.svn.sourceforge.net/svnroot/kibadock/trunk
_svnmod=kiba

build() {
	msg "Connecting to SVN server..."
	msg "Checking out $_svnmod"
	svn co $_svntrunk --config-dir ./ $_svnmod
	msg "SVN checkout done or server timeout"
	msg "Starting build..."
	cp -r $startdir/src/kiba/kiba-plugins $startdir/src/
	cd "$startdir/src/kiba-plugins/"
	CC="gcc -fPIC" ./autogen.sh --prefix=/usr
	#./configure --prefix=/usr
	make || return 1
	make DESTDIR=${startdir}/pkg install
	rm -rf $startdir/src/$_svnmod
}
