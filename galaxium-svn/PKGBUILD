# Contributor: Manuel "ekerazha" C. (www.ekerazha.com)
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=galaxium-svn
_realname=galaxium
pkgver=1634
pkgrel=1
pkgdesc="A multi-protocol instant messenger application designed for the GNOME desktop."
arch=('i686' 'x86_64')
url="http://code.google.com/p/galaxium/"
license=('GPL')
depends=('mono-addins>=0.3' 'libanculus-sharp>=0.3.1' 'gstreamer0.10' 'gecko-sharp-2.0' 'ndesk-dbus-glib' 'sqlite3' 'gtkspell' 'notify-sharp-svn')
makedepends=('subversion')
provides=("$_realname=0.8")
conflicts=("$_realname")
install=galaxium.install
source=()
md5sums=()

_svntrunk=http://galaxium.googlecode.com/svn/trunk
_svnmod=galaxium-read-only

build() {
	cd $startdir/src

	if [ -d $_svnmod/.svn ]; then
		(cd $_svnmod && svn up -r $pkgver)
	else
		svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
	fi

	msg "SVN checkout done or server timeout"
	msg "Starting make..."

	export MONO_SHARED_DIR=${startdir}/src/.wabi
	mkdir -p "${MONO_SHARED_DIR}"

	cp -r $_svnmod $_svnmod-build
	cd $_svnmod-build

	sh autogen.sh --prefix=/usr --enable-gecko --disable-webkit
	make || return 1
	make DESTDIR=$startdir/pkg install || return 1

	rm -rf $startdir/src/$_svnmod-build
}
