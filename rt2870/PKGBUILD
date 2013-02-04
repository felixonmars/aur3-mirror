#Contributor Antti Oja <antti.bofh(AT)gmail.com>
#Contributor Jakob Gruber <jakob.gruber(AT)kabelnet.at>
#Contributor Tanguy ALEXIS <alexis.alexis(AT)yahoo.fr>
pkgname=rt2870
pkgver=2.4.0.1
pkgrel=4
pkgdesc="Drivers for rt2870 chipset wireless cards"
arch=('i686' 'x86_64')
url="http://www.mediatek.com/en/Products/support.php?sn=501"
depends=('linux')
makedepends=('linux-headers')
license='GPL'
install=install.rt2870
md5sums=('9afbb7c60bcf17a5e8bfad89a4b14e0f' '2964cc3b322f52db822b25be2e77c02d')
fileprefix='2010_0709_RT2870_Linux_STA_v'
source=("${fileprefix}${pkgver}.tar.bz2" "2.6.35.patch")

build() {

  cd ${srcdir}/${fileprefix}${pkgver}

  #configure for being controlled by NetworkManager or wpa_supplicant wext functions

  sed "s#HAS_WPA_SUPPLICANT=n#HAS_WPA_SUPPLICANT=y#" -i os/linux/config.mk
  sed "s#HAS_NATIVE_WPA_SUPPLICANT_SUPPORT=n#HAS_NATIVE_WPA_SUPPLICANT_SUPPORT=y#" -i os/linux/config.mk

  #allow compilation on 2.6.35

  patch -Np2 < ${srcdir}/2.6.35.patch
  
  make
}
package() {

  cd ${srcdir}/${fileprefix}${pkgver}

  install -D -m 755 os/linux/rt2870sta.ko ${pkgdir}/lib/modules/$(uname -r)/kernel/drivers/net/wireless/rt2870sta.ko
  install -D -m 644 RT2870STA.dat ${pkgdir}/etc/Wireless/RT2870STA/RT2870STA.dat
  install -D -m 644 RT2870STACard.dat ${pkgdir}/etc/Wireless/RT2870STA/RT2870STACard.dat
}
