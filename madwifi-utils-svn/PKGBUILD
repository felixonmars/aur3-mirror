pkgname=madwifi-utils-svn
pkgver=4148
_kernver=2.6.27.7-AP
pkgrel=1
pkgdesc="Userspace tools of madwifi drivers for Atheros wireless chipsets."
arch=(i686 x86_64)
license=('GPL')
url="http://www.madwifi-project.org/"
depends=('wireless_tools')
makedepends=('sharutils' 'subversion')
provides=("madwifi-ng-utils" 'madwifi-utils')
conflicts=("madwifi-ng-utils" 'madwifi-utils')
replaces=("madwifi-ng-utils")
# subversion source: svn checkout http://svn.madwifi.org/madwifi/trunk madwifi
source=()
md5sums=()

_svntrunk=http://svn.madwifi-project.org/madwifi/trunk
_svnmod=trunk

build() {
	cd $srcdir
	if [ -d $_svnmod/.svn ]; then
		(cd $_svnmod && svn up) || return 1
	else
		svn co $_svntrunk -r $pkgver $svnmod || return 1
	fi
	msg "SVN checkout done or server timeout"
	msg "Starting make..."

	[ "${CARCH}" == "i686" ] && export ARCH=i386
	export KERNELPATH=/lib/modules/${_kernver}/build
	cd $srcdir/$_svnmod
	make tools|| return 1
	make DESTDIR=$pkgdir \
	BINDIR=/usr/bin \
	MANDIR=/usr/share/man \
	install-tools
}
