# Maintainer: Facundo Bianco (vando) <facundo{at}esdebian{dot}org>
pkgname=rtl8187-ng
pkgver=1010
pkgrel=5
pkgdesc="Drivers for Realtek RTL8187l Wifi card - Aircrack-ng patched (Monitor/Injection)"
arch=('i686' 'x86_64')
url="http://rtl-wifi.sourceforge.net/"
license=('GPL')
depends=('kernel26>=2.6.35')
provides=('rtl-wifi')
conflicts=('rtl-wifi')
install=rtl8187-ng.install
kernver=`uname -r`

source=(http://dl.aircrack-ng.org/drivers/rtl8187_linux_26.$pkgver.zip
	http://patches.aircrack-ng.org/rtl8187_2.6.35-monitor_only.patch)

md5sums=('c5b1c7e0c094fa943a52e1a78117308b'
         '4d67befaad6f34ddd4d84d629bd0e90a')

_prefix=/lib/modules/$kernver/kernel/drivers/net/wireless

build() {
	  cd $startdir/src/rtl8187_linux_26.1010.0622.2006
	  tar xzf drv.tar.gz || return 1
	  tar xzf stack.tar.gz || return 1
	  patch -Np1 -i ../rtl8187_2.6.35-monitor_only.patch || return 1
          make || return 1
	  install -d $startdir/pkg/$_prefix/rtl8187 || return 1
	  install -d $startdir/pkg/$_prefix/rtl_ieee80211 || return 1

	  install -Dm644 ./ieee80211/*.ko $startdir/pkg/$_prefix/rtl_ieee80211 || return 1
	  install -Dm644 ./beta-8187/*.ko $startdir/pkg/$_prefix/rtl8187 || return 1 
}
