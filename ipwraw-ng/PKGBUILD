# Contributor: Karol Maciaszek <karol.maciaszek@gmail.com>
pkgname=ipwraw-ng
pkgver=2.3.4
pkgrel=1
pkgdesc="Intel Pro/Wireless 3945 Injection Walkthrough" 
url="http://homepages.tu-darmstadt.de/~p_larbig/wlan/" 
license="GPL" 
arch=(i686)
depends=(kernel26) 
makedepends=()
_pkgdate=04022008
source=("http://dl.aircrack-ng.org/drivers/$pkgname-$pkgver-$_pkgdate.tar.bz2")
md5sums=('d62c03a627bbca7ddd7a7cf958014b7b')
install=$pkgname.install
build() { 
	cd $startdir/src/$pkgname || return 1
	make -f Makefile || return 1
	install -d $startdir/pkg/lib/modules/`uname -r`/kernel/drivers/net/wireless
	install -m 644 $startdir/src/$pkgname/ipwraw.ko $startdir/pkg/lib/modules/`uname -r`/kernel/drivers/net/wireless
	install -d $startdir/pkg/lib/firmware
	install -m 644 $startdir/src/$pkgname/ucode/iwlwifi-3945.ucode $startdir/pkg/lib/firmware
}

