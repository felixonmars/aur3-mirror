pkgname=rt3070ap
pkgver=2.4.0.1
pkgrel=6
pkgdesc="driver for RaLink RT3070USB WiFi adapter with access point support"
url="http://eng.ralinktech.com.tw/support.php?s=2"
license=('custom:proprietary')
arch=('i686' 'x86_64')
depends=('kernel26')
install=rt3070ap.install
backup=(etc/Wireless/RT2870AP/RT2870AP.dat)
source=(2010_0203_RT3070_SoftAP_v${pkgver}_DPA.tar.bz2
	rt3070.patch)

build() {
  cd $srcdir/2010_0203_RT3070_SoftAP_v${pkgver}_DPA
  [ $NOEXTRACT -eq 1 ] || patch -p1 <$srcdir/rt3070.patch
  make

  install -D -m 644 -c MODULE/RT2870AP.dat $pkgdir/etc/Wireless/RT2870AP/RT2870AP.dat
  mkdir -p $pkgdir/lib/modules/$(uname -r)/misc
  find . -type f -name \*.ko -exec install -m 644 {} $pkgdir/lib/modules/$(uname -r)/misc/ \;
}
md5sums=('ad6c215ee74dc1f7de5ea7b93be684da'
         'd48f303466bdfd15d39ff4f4915570c0')
