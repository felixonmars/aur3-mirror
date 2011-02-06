# Contributor: George Kibardin <george-kibardin at yandex dot ru>
pkgname=easy-slow-down-manager
pkgver=0.3
pkgrel=4
pkgdesc="A fan control kernel module for Samsung laptops"
arch=('i686' 'x86_64')
url="http://code.google.com/p/easy-slow-down-manager"
license=('GPL')
depends=('kernel26' 'kernel26-headers')
source=(http://easy-slow-down-manager.googlecode.com/files/$pkgname-$pkgver.tar.gz)
md5sums=('a6fa2ff7bca2f451bfe996e2cb7cfe49')

build() {
  cd "$srcdir"
#compile the module
  make || return 1
#install the module in the pkgdir
  install -D -m 644 easy_slow_down_manager.ko $pkgdir/lib/modules/`uname -r`/kernel/drivers/misc/easy_slow_down_manager.ko || return 1
  install -D -m 644 samsung-backlight.ko $pkgdir/lib/modules/`uname -r`/kernel/drivers/misc/samsung-backlight.ko || return 1
  install -D -m 644 README $pkgdir/usr/share/doc/easy-slow-down-manager/README || return 1
}

