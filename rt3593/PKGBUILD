# Maintainer: heaven <aheaven87 at gmail dot com>
# Contributor: Federico Cinelli <cinelli@aur.archlinux.org>

pkgname=rt3593
pkgver=2.5.0.0
pkgrel=3
pkgdesc='Drivers for ralink chipset wireless cards'
arch=('any')
url='http://www.mediatek.com/_en/07_downloads/01-1_windowsDetail.php?sn=5034'
depends=('linux')
makedepends=('linux-headers' 'dos2unix')
license=('GPL')
install='rt3593.install'
source=('20120911_RT3573_Linux_STA_v2.5.0.0_Rev1_DPO.tar.bz2'
	   'Makefile.patch'
	   'config.mk.patch'
	   'rtusb_dev_id.patch'
	   'rtmp_def.patch'
	   'sta_cfg.patch'
	   'rt_linux.patch'
	   'rt_linux_h.patch'
	   'rt_linux_cmm.patch'
	   'usb_main_dev.patch')
md5sums=('90271e96c41f92bcad406ffd5628af1b'
	    '2d8e5a1035bb7f73867bcbbfdead83c1'
	    '5dcb3d42d812468ef3bd83203ce213b6'
	    '003c67006bfaf191d86ff99e05f80078'
	    '770864d213363dc582ef4dc1972b2550'
	    'a5369f27b1c0295d4b5620fefa01f6db'
	    '45ec04501a8a7bd93823a527bd271a01'
	    'a1dbce9fe0574b1ba14ea3b86b40d118'
	    '61b4d105a3feb79af79be3ffdc226d57'
	    'f3611edc4299d25370997a494efcc0f8')

conflicts=('rt3573')

_prefix='20120911_RT3573_Linux_STA_v2.5.0.0_Rev1_DPO'

# Download the source @ http://www.mediatek.com/_en/07_downloads/01-1_windowsDetail.php?sn=5034
# Place it inside the PKGBUILDs directory and double check it's md5sum with the one at the top
# of the list.

build() {
  cp -r "$_prefix" "$srcdir/$pkgname-$pkgver"
  cd "$srcdir/$pkgname-$pkgver"

  # Do not install anything to /
  patch -Np2 < "$srcdir/Makefile.patch"
  
  # Enable wpa_supplicant support
  patch -Np2 < "$srcdir/config.mk.patch"

  # Add support for Linksys AE3000
  patch -Np2 < "$srcdir/rtusb_dev_id.patch"
  
  # Set device name to wlan
  patch -Np2 < "$srcdir/rtmp_def.patch"
  
  # Kernel panic fix
  patch -Np2 < "$srcdir/rt_linux.patch"
  patch -Np2 < "$srcdir/rt_linux_h.patch"
  
  # Name conflicts
  patch -Np2 < "$srcdir/rt_linux_cmm.patch"
  patch -Np2 < "$srcdir/usb_main_dev.patch"
  
  # Remove date time
  patch -Np2 < "$srcdir/sta_cfg.patch"
  
  mv RT2870STA.dat RT3573STA.dat
  mv RT2870STACard.dat RT3573STACard.dat
  sed -i 's/2870/3573/g' *STA*
  
  chmod 0644 RT3573* README* *.txt
  dos2unix RT3573* README* *.txt
  
  # change respective references in documentation, too
  sed -i 's|ra0|wlan0|g' *.txt README* *.dat
  sed -i 's|ra1|wlan1|g' *.txt README* *.dat
  sed -i 's|ra2|wlan2|g' *.txt README* *.dat

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm 755 'os/linux/rt3573sta.ko' "$pkgdir/usr/lib/modules/$(uname -r)/kernel/drivers/net/wireless/rt3573sta.ko"
  install -Dm 644 'RT3573STA.dat' "$pkgdir/etc/Wireless/RT3573STA/RT3573STA.dat"
  install -Dm 644 'RT3573STACard.dat' "$pkgdir/etc/Wireless/RT3573STA/RT3573STACard.dat"
}
