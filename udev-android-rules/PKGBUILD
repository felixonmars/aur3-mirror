pkgname=udev-android-rules
pkgver=0.3
pkgrel=2
pkgdesc='Udev rules to connect Android devices to you linux box'
arch=('any')
url="http://developer.android.com/guide/developing/device.html"
license=('unknown')
source=('51-android.rules')
depends=('udev')
install='udev-android-rules.install'
md5sums=('8cd9a3a9bd250355c4f6a341369ab4f6')

build() {
   
  mkdir -p $pkgdir/etc/udev/rules.d/
  cp $srcdir/51-android.rules $pkgdir/etc/udev/rules.d/51-android.rules
  chmod a+r $pkgdir/etc/udev/rules.d/51-android.rules
  
}
