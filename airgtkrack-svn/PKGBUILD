#Maintainer:
#Contributor:

pkgname=airgtkrack-svn
pkgver=189
pkgrel=1
pkgdesc="Graphical Wifi cracking tool"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/airgtkrack/"
license=('GPL')
depends=('wireless_tools' 'gtk2' 'openssl')
makedepends=('subversion')
provides=('airgtkrack')
conflicts=('airgtkrack')
install='airgtkrack.install'
source=('airgtkrack.install' 'rc_airgtkrack')
md5sums=('a361aa50c74a3747ae85d177c09986c0'
	 '5950ebe869bb02f96019b5adab0b54f5')

_svnmod="airgtkrack"
_svntrunk="https://airgtkrack.svn.sf.net/svnroot/airgtkrack/trunk/"

build() {
	cd $srcdir
	msg "Connecting to SVN server...."

	if [[ -d "$_svnmod/.svn" ]]; then
		(cd "$_svnmod" && svn up -r "$pkgver")
	else
		svn co "$_svntrunk" --config-dir ./ -r "$pkgver" "$_svnmod"
	fi

	msg "SVN checkout done or server timeout"
	msg "Starting build..."

	rm -rf "$srcdir/$_svnmod-build"
	svn export "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
	cd "$srcdir/$_svnmod-build"

	./autogen.sh
	./configure --with-gtk=yes --prefix=$pkgdir/usr/
	make clean
	make all
}

package() {
	make install

	# the rc-script (more or less obsolete now, because of systemd)
	mkdir -p $pkgdir/etc/rc.d/
	install -D -m755 ../../rc_airgtkrack $pkgdir/etc/rc.d/airgtkrack
}
