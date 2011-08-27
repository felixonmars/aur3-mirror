# Contributer: N30N <archlinux@alunamation.com>

pkgname=m5602-usb-svn
pkgver=493
pkgrel=1
pkgdesc="ALi M5602 webcam driver"
url="http://m560x-driver.sourceforge.net/"
license="GPL"
arch=("i686" "x86_64")
depends=("libv4l")
makedepends=("subversion")
source=()
md5sums=()

_svntrunk="https://m560x-driver.svn.sourceforge.net/svnroot/m560x-driver"
_svnmod="m560x-driver"

build() {
	cd ${srcdir}
	msg "Connecting to blender SVN server......."
	if [ -d ${_svnmod}/.svn ]; then
		cd ${_svnmod}
		svn update -r ${pkgver}
		cd m560x/branches/m5602-gspca
		make clean
	else
		svn co ${_svntrunk} ${_svnmod} --config-dir ./ -r ${pkgver} || return 1
		cd ${_svnmod}/m560x/branches/m5602-gspca
	fi

	msg "Starting build process."
	make || return 1

	mkdir -p ${pkgdir}/lib/modules/`uname -r`/kernel/drivers/usb/media
	install -m644 gspca_main.ko ${pkgdir}/lib/modules/`uname -r`/kernel/drivers/usb/media/gspca_main.ko
	install -m644 gspca_m5602.ko ${pkgdir}/lib/modules/`uname -r`/kernel/drivers/usb/media/gspca_m5602.ko
}
