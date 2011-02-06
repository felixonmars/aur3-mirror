pkgname=airgtkrack-svn
pkgver=188
pkgrel=1
pkgdesc="Graphical Wifi cracking tool"
arch=(i686 x86_64)
url="http://sourceforge.net/projects/airgtkrack/"
license=('GPL')
depends=('wireless_tools' 'gtk2' 'openssl')
makedepends=('subversion' 'make' 'pkgconfig')
provides=('airgtkrack')
conflicts=('airgtkrack')
install=('airgtkrack.install')
source=(airgtkrack.install \
	rc_airgtkrack)
md5sums=('a361aa50c74a3747ae85d177c09986c0'
	 '5950ebe869bb02f96019b5adab0b54f5')

_svnmod="airgtkrack"
_svntrunk="https://airgtkrack.svn.sf.net/svnroot/airgtkrack/trunk/"

build() {
	cd $startdir/src/
	mkdir -p ~/.subversion; touch ~/.subversion/servers
	msg "Connecting to $_svnmod.sf.net SVN server..."
	svn co $_svntrunk $_svnmod

	msg "SVN checkout done or server timeout"
	msg "Starting make..."

	cd ./$_svnmod

	mkdir -p $startdir/pkg/usr/
	# compile
	./autogen.sh || return 1
	./configure --with-gtk=yes --prefix=$startdir/pkg/usr/ || return 1
	make clean || return 1
	make all || return 1

	msg "Installing..."
	make install || return 1

	# the daemon
	mkdir -p $startdir/pkg/etc/rc.d/
	install -D -m755 ../../rc_airgtkrack $startdir/pkg/etc/rc.d/airgtkrack
}
