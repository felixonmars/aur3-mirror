# Contributor: nofxx <x@nofxx.com>
# Maintainer: Merkil <merkil33@gmail.com>
pkgname=rt73-k2wrlz
pkgver=3.0.3
pkgrel=4
pkgdesc="RaLink RT73 USB Enhanced Drivers"
arch=('i686' 'x86_64')
url="http://homepages.tu-darmstadt.de/~p_larbig/wlan"
license=('GPL')
depends=('kernel26')
makedepends=('kernel26-headers')
provides=('rt73-k2wrlz')
conflicts=('rt73-k2wrlz')
install=rt73.install
source=(http://homepages.tu-darmstadt.de/~p_larbig/wlan/$pkgname-$pkgver.tar.bz2
		Makefile.diff
		use_sema_init.diff
		rtmp_main.diff
		rt_config_big_smp_lock.diff
		3.2_wireless_abi.diff
)
md5sums=('904c1e22c5d635ba24c88e5f92c84941'
		 '5dfff4d1021d3d802b859f54f09dfc9e'
		 '673bda97484f219c30c13e472493036a'
		 '73ab284e841e40e078e384b6cdc80e6f'
		 '9f83195a7a07d64554d6cfbb388feb04'
		 '04881f4965a706d570342886cad41bda')
_kernver=`uname -r`

build() {
	mv *diff $startdir/src/$pkgname-$pkgver/Module
	cd $startdir/src/$pkgname-$pkgver/Module
	
	patch < Makefile.diff || return 1
	patch < use_sema_init.diff || return 1
	patch < rtmp_main.diff || return 1
	patch < rt_config_big_smp_lock.diff || return 1
	patch < 3.2_wireless_abi.diff || return 1
	
	make || return 1
	install -Dm644 rt73.ko $startdir/pkg/lib/modules/$_kernver/kernel/drivers/net/wireless/rt73.ko || return 1
}
