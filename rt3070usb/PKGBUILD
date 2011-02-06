pkgname=rt3070usb
pkgver=2.3.0.4
_pkgdate=20100604
pkgrel=1
pkgdesc="Kernel module and firmware for RaLink RT3070USB WiFi adapter"
url="http://eng.ralinktech.com.tw/support.php?s=2"
license=('GPL')
arch=('i686' 'x86_64')
depends=('kernel26')
install=rt3070usb.install
backup=(etc/Wireless/RT2870STA/RT2870STA.dat)
source=(DPO_RT3070_LinuxSTA_V${pkgver}_${_pkgdate}.tar.bz2
	rt3070.patch)
md5sums=('bbfa7a278ae8fa0208499aee048ed1ed'
         '18793420a6f1576c5c9f856f09346641')

build() {
  cd $srcdir/
  tar xf DPO_RT3070_LinuxSTA_V${pkgver}_${_pkgdate}

  cd $srcdir/DPO_RT3070_LinuxSTA_V${pkgver}_${_pkgdate}
  sed -i /"tftpboot"/d Makefile
  patch -p1 <$srcdir/rt3070.patch
  make || return 1

  install -D -m 644 -c RT2870STA.dat $pkgdir/etc/Wireless/RT2870STA/RT2870STA.dat && \
  install -D -m 644 -c os/linux/rt3070sta.ko $pkgdir/lib/modules/$(uname -r)/misc/rt3070sta.ko && \
  install -D -m 644 -c README_STA_usb $pkgdir/usr/share/doc/rt3070usb/README_STA_usb && \
  install -m 644 -c *.txt $pkgdir/usr/share/doc/rt3070usb/ && \
  install -m 644 -c *.dat $pkgdir/usr/share/doc/rt3070usb/
}
