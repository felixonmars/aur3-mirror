#Contributor Aeternus Atterratio <atterratio(AT)gmail.com>
pkgname=rt5370
pkgver=2.5.0.3
pkgrel=4
pkgdesc="Drivers for rt5370 chipset wireless cards(e.c. D-Link DWA-125 A3)"
arch=('i686' 'x86_64')
url="http://www.mediatek.com/en/Products/support.php?sn=501"
depends=('linux')
makedepends=('linux-headers')
conflicts=('rt2870')
license='unknown'
install=install.rt5370
md5sums=('f83689a5120f772d47983d7c5658ae6c' 'e0638077a5e8e58ce888feae9d352174')
prefix='2011_0719_RT3070_RT3370_RT5370_RT5372_Linux_STA_V'
postfix='_DPO'
source=("http://dl.dropbox.com/u/21827288/${prefix}${pkgver}${postfix}.bz2" "strange.patch")

build() {

  cd ${srcdir}/${prefix}${pkgver}${postfix}

  #configure for being controlled by NetworkManager or wpa_supplicant wext functions

  sed "s#HAS_WPA_SUPPLICANT=n#HAS_WPA_SUPPLICANT=y#" -i os/linux/config.mk
  sed "s#HAS_NATIVE_WPA_SUPPLICANT_SUPPORT=n#HAS_NATIVE_WPA_SUPPLICANT_SUPPORT=y#" -i os/linux/config.mk
  
  #Chenge some strange in Makefile

  patch -Np2 < ${srcdir}/strange.patch

  make
}
package() {

  cd ${srcdir}/${prefix}${pkgver}${postfix}

  install -D -m 755 os/linux/rt5370sta.ko ${pkgdir}/lib/modules/$(uname -r)/kernel/drivers/net/wireless/rt5370sta.ko
  install -D -m 644 RT2870STA.dat ${pkgdir}/etc/Wireless/RT2870STA/RT2870STA.dat
}
