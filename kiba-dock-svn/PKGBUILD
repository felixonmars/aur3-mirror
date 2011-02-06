# Contributor: sickhate <vivid@tux-linux.net>

pkgname=kiba-dock-svn
pkgver=861
pkgrel=1
pkgdesc="a fun dock program for Compiz"
arch=(i686 , x86_64)
url="http://www.kiba-dock.org/"
license=('GPL')
depends=('librsvg' 'akamaru-svn' 'gnome-desktop')
makedepends=('subversion' 'pkgconfig' 'intltool')
conflicts=('kiba-dock'  'kibadock')
provides=('kiba-dock')
source=()
md5sums=()

_svntrunk=https://kibadock.svn.sourceforge.net/svnroot/kibadock/trunk
_svnmod=kiba

build() {
	msg "Connecting to SVN server..."
	msg "Checking out $_svnmod"
	svn co $_svntrunk --config-dir ./ $_svnmod
	cp -r $startdir/src/kiba/kiba-dock $startdir/src/
	cd "$startdir/src/kiba-dock/"
	CC="gcc -fPIC" ./autogen.sh --prefix=/usr
	make || return 1
	make DESTDIR=${startdir}/pkg install
	rm -rf $startdir/src/$_svnmod
}
