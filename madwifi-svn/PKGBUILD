_kernver=`uname -r`
pkgname=madwifi-svn
pkgver=4148
pkgrel=1
pkgdesc="Madwifi drivers for Atheros wireless chipsets. For stock arch 2.6 kernel"
arch=(i686 x86_64)
license=('GPL')
url="http://www.madwifi-project.org/"
depends=('madwifi-utils-svn' 'kernel26')
provides=('madwifi')
conflicts=('madwifi')
makedepends=('sharutils' 'subversion')
install=madwifi-ng.install
source=()
md5sums=()

_svntrunk=http://svn.madwifi-project.org/madwifi/trunk
_svnmod=trunk

build() {
	cd $srcdir
	if [ -d $_svnmod/.svn ]; then
		(cd $_svnmod && svn up) || return 1
	else
		svn co $_svntrunk -r $pkgver $_svnmod || return 1
	fi
	msg "SVN checkout done or server timeout"
	msg "Starting make..."

	[ "${CARCH}" == "i686" ] && export ARCH=i386
	cd $srcdir/$_svnmod
	sed -i -e 's/-Werror//g' Makefile.inc
	make KERNELPATH=/lib/modules/$_kernver/build KERNELRELEASE=$_kernver modules|| return 1
	make KERNELPATH=/lib/modules/$_kernver/build KERNELRELEASE=$_kernver modules \
	DESTDIR=$pkgdir KERNELRELEASE=$_kernver install-modules
	sed -i -e "s/KERNEL_VERSION='.*'/KERNEL_VERSION='${_kernver}'/" $startdir/*.install

	# install to wireless kernel directory
	mkdir -p $pkgdir/lib/modules/$_kernver/kernel/drivers/net/wireless/madwifi
	mv $pkgdir/lib/modules/$_kernver/net/* $pkgdir/lib/modules/$_kernver/kernel/drivers/net/wireless/madwifi
	rm -r $pkgdir/lib/modules/$_kernver/net/
}

