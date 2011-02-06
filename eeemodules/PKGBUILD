# Maintainer: dkite <dkite@shaw.ca>

pkgname=eeemodules
pkgver=0.0.3
pkgrel=4
#kgrel=$(pacman -Qii kernel26 | grep Version | sed s/Version\ \*:\ // | sed s/-/./)
pkgdesc="Kernel Modules for EEEPC"
arch=("i686")
license=('GPL')
depends=('kernel26')
makedepends=('unrar' 'svn')
url="http://members.shaw.ca/dkite"
install=eeemodules.install
source=(http://people.redhat.com/csnook/atl2/atl2-2.0.3.tar.bz2
        ftp://ftp.asus.com/pub/ASUS/EeePC/701/ASUS_ACPI_071126.rar
	http://downloads.openwrt.org/people/mbm/eee/kernel/wifi/madwifi-src-patched.tar.gz
        acpi.patch
	asus_acpi.makefile.patch
        atl2-2.0.3-modules_owner.patch
	)
md5sums=('4aead641a000117ccc9b8421c82bdf7f'
	'9f4b2815b8965624e639d1e7588b6cd0'
	'dac9f9bfb56b028582b308e4796e1665'
	'f99f1eed1a9b2283f3346b267d1b9a81'
	'3b3a79642c99150bf4a2e883ddfd23d6'
	'e173f343d08d4a19054e22c0ad86c2a6')


svnm=linux_uvc
svnt=svn://svn.berlios.de/linux-uvc/linux-uvc/trunk
build() {

	cd ${startdir}/src/atl2-2.0.3
	patch -p1 <../atl2-2.0.3-modules_owner.patch
	msg "start to make atl2"
	make
	msg "copying atl2.ko"
	install -D -m644 atl2.ko $startdir/pkg/lib/modules/$(uname -r)/kernel/drivers/net/atl2.ko
#	mkdir -p ${startdir}/pkg/lib/modules/2.6.23-ARCH/kernel/drivers/net
#	cp  atl2.ko ${startdir}/pkg/lib/modules/2.6.23-ARCH/kernel/drivers/net/
	msg "svn up"
	cd ${startdir}/src
	if [ -d $svnm/.svn ]; then
	   (cd $svnm && svn up)
	else
	   svn co $svnt --config-dir ./ -r HEAD $svnm
	fi
	msg "SVN checkout of  done or server timeout"
	msg "Starting make..."
        rm -rf $svnm-build
	cp -rf $svnm $svnm-build
	cd $svnm-build
	make
	install -D -m644 uvcvideo.ko $startdir/pkg/lib/modules/$(uname -r)/usb/media/uvcvideo.ko

#	mkdir -p ${startdir}/pkg/lib/modules/2.6.23-ARCH/kernel/drivers/video
#	cp uvcvideo.ko ${startdir}/pkg/lib/modules/2.6.23-ARCH/kernel/drivers/video

	# install the asus_acpi modules
	cd $startdir/src
	unrar e -y ASUS_ACPI_071126.rar
	tar -xzf asus_acpi.tar.gz
        cd asus_acpi
	patch -p0 <../acpi.patch
	patch -p1 < ../asus_acpi.makefile.patch
	make
	install -D -m644 asus_acpi.ko $startdir/pkg/lib/modules/$(uname -r)/kernel/drivers/acpi/asus_acpi.ko
	
	# install atheros wifi driver
	cd $startdir/src/madwifi-ng-r2756-20071018
#	patch -p0 <../madwifi-ng-0933.ar2425.20071130.i386.patch?format=raw
	BINDIR=/usr/bin MANDIR=/usr/man make
	BINDIR=/usr/bin MANDIR=/usr/man make DESTDIR=$startdir/pkg install
}
