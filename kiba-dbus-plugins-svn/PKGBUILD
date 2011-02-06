# Contributor: sickhate <sickhate@tux-linux.net>

pkgname=kiba-dbus-plugins-svn
pkgver=544
pkgrel=2
pkgdesc="a fun dock program for Compiz"
arch=('i686' 'x86_64')
url="http://www.kiba-dock.org/"
license=('GPL')
depends=('librsvg' 'akamaru-svn' 'kiba-dock-svn' 'gnome-desktop' 'dbus')
makedepends=('subversion' 'pkgconfig' 'intltool' )
options=()
conflicts=('kiba-dbus-plugins')
provides=('kiba-dbus-plugins')
source=()
md5sums=()

_svntrunk=https://kibadock.svn.sourceforge.net/svnroot/kibadock/trunk
_svnmod=kiba

build() {
	msg "Connecting to SVN server..."
	msg "Checking out $_svnmod"
	svn co $_svntrunk --config-dir ./ $_svnmod
	cp -r $startdir/src/kiba/kiba-dbus-plugins $startdir/src/
	cd "$startdir/src/kiba-dbus-plugins/"
	./autogen.sh --prefix=/usr
	make || return 1
	make DESTDIR=${startdir}/pkg install
	rm -rf $startdir/src/$_svnmod
}

