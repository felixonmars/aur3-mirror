# Contributor: _AND_ <and@ebrilo.jp>
license=('unknown')
arch=('i686')
pkgname=rt2870usb
pkgver=2.2.0.0
pkgrel=1
pkgdesc="Kernel module and firmware for RaLink RT2870USB (RT2870/RT2770) WiFi adapter"
url=http://web.ralinktech.com/ralink/Home/Support/Linux.html
depends=('kernel26')
source=(http://www.ralinktech.com.tw/data/drivers/2009_0820_RT2870_Linux_STA_V$pkgver.tar.bz2 http://www.ralinktech.com.tw/data/drivers/RT2870_Firmware_V8.zip)
md5sums=('33672280af8b3275f17dbb8ecdc29fba' 'a7aae1d8cfd68e4d86a73000df0b6584')

build() {
  cd $srcdir/2009_0820_RT2870_Linux_STA_V$pkgver
  mv $srcdir/2009_0820_RT2870_Linux_STA_V$pkgver/Makefile $srcdir/2009_0820_RT2870_Linux_STA_V$pkgver/Makefile.old
  sed /"tftpboot"/d $srcdir/2009_0820_RT2870_Linux_STA_V$pkgver/Makefile.old > $srcdir/2009_0820_RT2870_Linux_STA_V$pkgver/Makefile
  make || return 1
  install -d $pkgdir/etc/Wireless/RT2870STA/
  install -m 644 -c $srcdir/2009_0820_RT2870_Linux_STA_V$pkgver/RT2870STA.dat $pkgdir/etc/Wireless/RT2870STA/
  install -d $pkgdir/lib/firmware
  install -m 644 -c $srcdir/RT2870_Firmware_V8/rt2870.bin $pkgdir/lib/firmware/
  install -d $pkgdir/lib/modules/$(uname -r)/kernel/drivers/net/wireless/
  install -m 644 -c $srcdir/2009_0820_RT2870_Linux_STA_V$pkgver/os/linux/rt2870sta.ko $pkgdir/lib/modules/$(uname -r)/kernel/drivers/net/wireless/
  install -d $pkgdir/usr/share/doc/rt2870usb/
  install -m 644 -c $srcdir/2009_0820_RT2870_Linux_STA_V$pkgver/README_STA $pkgdir/usr/share/doc/rt2870usb/
  install -m 644 -c $srcdir/2009_0820_RT2870_Linux_STA_V$pkgver/*.txt $pkgdir/usr/share/doc/rt2870usb/
  install -m 644 -c $srcdir/2009_0820_RT2870_Linux_STA_V$pkgver/*.dat $pkgdir/usr/share/doc/rt2870usb/
}
