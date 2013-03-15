#Maintainer: Federico Cinelli <cinelli@aur.archlinux.org>

pkgname=rt3573
pkgver=2.5.0.0
pkgrel=1
pkgdesc="Drivers for ralink chipset wireless cards"
arch=('any')
url="http://www.mediatek.com/_en/07_downloads/01-1_windowsDetail.php?sn=5034"
depends=('linux')
makedepends=('linux-headers')
license=('GPL')
install='rt3573.install'
source=("20120911_RT3573_Linux_STA_v2.5.0.0_Rev1_DPO.tar.bz2"
	"Makefile.patch"
	"Makefile.6.patch"
	"config.mk.patch")
md5sums=('90271e96c41f92bcad406ffd5628af1b'
	 '2d8e5a1035bb7f73867bcbbfdead83c1'
	 '8518ffcdab1611759d1addcd82688f16'
	 '15291c38f6be17350893bcd0d3f0f149')

_prefix="20120911_RT3573_Linux_STA_v2.5.0.0_Rev1_DPO"

# Download the source @ http://www.mediatek.com/_en/07_downloads/01-1_windowsDetail.php?sn=5034
# Place it inside the PKGBUILDs directory and double check it's md5sum with the one at the top
# of the list.

build() {
  cp -r "$_prefix" "$srcdir/$pkgname-$pkgver"
  cd "$srcdir/$pkgname-$pkgver"

  # They want to play in my / ?!!! DENIED!!
  patch -Np2 < "$srcdir/Makefile.patch"
  patch -Np2 < "$srcdir/Makefile.6.patch"
  patch -Np2 < "$srcdir/config.mk.patch"

  # Add wpa_supplicant support
  sed "s#HAS_WPA_SUPPLICANT=n#HAS_WPA_SUPPLICANT=y#" -i "os/linux/config.mk"
  sed "s#HAS_NATIVE_WPA_SUPPLICANT_SUPPORT=n#HAS_NATIVE_WPA_SUPPLICANT_SUPPORT=y#" -i "os/linux/config.mk"

  make
}
package() {
  cd "$srcdir/$pkgname-$pkgver"

  make MOD_NAME="rt3573sta" DAT_PATH="$pkgdir" DESTDIR="$pkgdir" install

  install -Dm 755 "os/linux/rt3573sta.ko" "$pkgdir/usr/lib/modules/$(uname -r)/kernel/drivers/net/wireless/rt3573sta.ko"
  install -Dm 644 "RT2870STA.dat" "$pkgdir/etc/Wireless/RT2870STA/RT2870STA.dat"
  install -Dm 644 "RT2870STACard.dat" "$pkgdir/etc/Wireless/RT2870STA/RT2870STACard.dat"

}
