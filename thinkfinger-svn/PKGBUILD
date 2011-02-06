# Contributor: Christoph Siegenthaler <csi@gmx.ch>
pkgname=thinkfinger-svn
pkgver=88
pkgrel=3
pkgdesc="ThinkFinger is a driver for the SGS Thomson Microelectronics fingerprint reader found in most IBM/Lenovo ThinkPads"
url="http://thinkfinger.sourceforge.net/"
arch=('i686')
license=("GPL")
depends=('pam' 'libusb')
makedepends=('subversion' 'automake' 'autoconf')
conflicts=('thinkfinger')
provides=('thinkfinger')
source=('')
options=('nolibtool')
md5sums=('')

_svntrunk=https://thinkfinger.svn.sourceforge.net/svnroot/thinkfinger
_svnmod=thinkfinger

build() {
	mkdir -p $startdir/pkg/etc/pam_thinkfinger
	cd $startdir/src
	
	svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
#	svn co $_svntrunk --config-dir ./ $_svnmod
	msg "SVN checkout done or server timeout"
	msg "Starting make..."
	
	cp -r $_svnmod $_svnmod-build
	cd $_svnmod-build

	./autogen.sh
	./configure --prefix=/usr --with-securedir=/lib/security --with-birdir=/etc/pam_thinkfinger
	make || return 1
	make DESTDIR=$startdir/pkg install
}
