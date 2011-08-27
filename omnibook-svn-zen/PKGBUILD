# Contributor: Patrick Bartels <p4ddy.b@gmail.com>

_kernver="2.6.24-zen"

pkgname="omnibook-svn-zen"
pkgver="268"
pkgrel="1"
pkgdesc="Kernel module for HP OmniBook, Pavilion, Toshiba and Compal ACL00 laptops"
url="http://omnibook.sourceforge.net"
license=("GPL2")
arch=("i686" "x86_64")
depends=("kernel26zen>=2.6.24.rc2.zen0-1")
makedepends=("subversion")
conflicts=("omnibook-zen")
provides=("omnibook-zen")
install=omnibook.install
source=()
md5sums=()

_svntrunk=https://omnibook.svn.sourceforge.net/svnroot/omnibook/omnibook/trunk/
_svnmod=omnibook

build() {
	cd $startdir/src

	msg "Checking out revision $pkgver"
	svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod

	rm -rf $_svnmod-build
	cp -r $_svnmod $_svnmod-build
	cd $_svnmod-build

	make KVER=$_kernver || return 1
	install -D -m644 omnibook.ko \
		$startdir/pkg/lib/modules/$_kernver/kernel/drivers/misc/omnibook.ko

	sed -i  "s/KERNEL_VERSION=.*/KERNEL_VERSION=$_kernver/g" \
		$startdir/omnibook.install
}
