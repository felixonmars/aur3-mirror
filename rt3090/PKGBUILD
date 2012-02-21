# Contributor Alper Kanat <alperkanat@raptiye.org>
# Contributor Jaeic Lee <zeraxeal@gmail.com>
# Contributor Zhang Li <richselian@gmail.com>
# Based on rt2860 package from Marius Dransfeld <marius.dransfeld@gmail.com>

pkgname="rt3090"
pkgver="2.4.0.4"
pkgrel=1
pkgdesc="Drivers for rt3090 chipset wireless cards"
arch=("i686" "x86_64")
url="http://www.ralinktech.com/"
license="GPL"
makedepends=("linux-headers" "unzip")
conflicts=("rt2860")
install="rt3090.install"

source=("http://mirror.thebasementserver.com/soft/ralink/linux/2010_1217_RT3090_LinuxSTA_V${pkgver}_WiFiBTCombo_DPO.zip"
	"config.mk.new"
	"Makefile.new"
)
md5sums=('a248bc88acf561b2954eae98edaf72f2'
         'f973b7b4f7959c2ca34f5cc0251eb9d1'
         '834d5133eedc032ccb68915512ee1be8')

build() {
	cd $srcdir/20101216_RT3090_LinuxSTA_V${pkgver}_WiFiBTCombo_DPO
	cp -f ../config.mk.new os/linux/config.mk
	cp -f ../Makefile.new Makefile
	make
}

package() {
	cd $srcdir/20101216_RT3090_LinuxSTA_V${pkgver}_WiFiBTCombo_DPO
	install -Dm644 RT2860STA.dat \
		$pkgdir/etc/Wireless/RT2860STA/RT2860STA.dat
	install -Dm644 os/linux/rt3090sta.ko \
		$pkgdir/lib/modules/$(uname -r)/kernel/drivers/net/wireless/rt3090sta.ko
}

