# Contributor: Vlatko Kosturjak <kost@linux.hr>

pkgname=dcled
pkgver=2.2
pkgrel=1
pkgdesc="Dream Cheeky USB Message Board utility"
url="http://www.last-outpost.com/~malakai/dcled/"
license=GPL
depends=('glibc' 'libusb' 'libhid')
makedepends=('gcc' 'make')
backup=(etc/udev/rules.d/40-dcled.rules)
source=("http://www.last-outpost.com/~malakai/dcled/dcled-$pkgver.tgz")
md5sums=('2ebf86cd8baae3e668b14ccd23616635')
arch=('i686' 'x86_64')

package() {
  cd $startdir/src/$pkgname-$pkgver/
  make
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/etc/udev/rules.d/
  install -m 755 -s $startdir/src/$pkgname-$pkgver/dcled $pkgdir/usr/bin
  install -m 644 $startdir/src/$pkgname-$pkgver/40-dcled.rules $pkgdir/etc/udev/rules.d/
}

