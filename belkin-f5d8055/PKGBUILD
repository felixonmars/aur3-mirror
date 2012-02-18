#Contributor Florian Langenhahn <bp(AT)9y.com>
#Contributor Philipp Eschenbach <p3(AT)9y.com>
pkgname=belkin-f5d8055
pkgver=2.5.0.3
pkgrel=1
pkgdesc="Drivers for the Belkin f5d8055v2 Wi-Fi usb adapter"
arch=('i686' 'x86_64')
url="http://www.mediatek.com/en/Products/support.php?sn=501"
depends=('linux')
makedepends=('linux-headers')
license='GPL'
install=install.f5d8055v2
md5sums=('f83689a5120f772d47983d7c5658ae6c' '82c2062e03b7857f8aa9f674bf0998bb')
dir="2011_0719_RT3070_RT3370_RT5370_RT5372_Linux_STA_V${pkgver}_DPO"
source=("http://dl.dropbox.com/u/20547030/${dir}.bz2" "f5d8055v2.patch")

build() {

  cd ${srcdir}/

  # patch
  patch -Np0 < f5d8055v2.patch

  cd ${dir}
  make
}
package() {
  cd ${srcdir}/${dir}

  install -D -m 755 os/linux/rt5370sta.ko ${pkgdir}/lib/modules/$(uname -r)/kernel/drivers/net/wireless/rt5370sta.ko
  install -D -m 644 RT2870STA.dat ${pkgdir}/etc/Wireless/RT2870STA/RT2870STA.dat
  install -D -m 644 RT2870STACard.dat ${pkgdir}/etc/Wireless/RT2870STA/RT2870STACard.dat
}
