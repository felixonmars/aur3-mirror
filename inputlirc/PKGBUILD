# Maintainer: Thomas schaz <schazet at gmail do com>
# taken over from Achim Schumacher <achimencey dot as at gmail dot com>
pkgname=inputlirc
pkgver=23
pkgrel=3
pkgdesc="Zeroconf LIRC daemon that reads from /dev/input/event devices"
arch=(i686 x86_64)
url="http://ftp.de.debian.org/debian/pool/main/i/inputlirc/"
license=('GPL')
conflicts=('inputlircd-svn')
backup=('etc/inputlircd.conf')
source=($url/inputlirc_$pkgver.orig.tar.gz
        inputlircd.conf
        inputlircd.service)
md5sums=('15ae021115fc266966b6a93083d0b046'
            '7a9994d742f7b0e180ccb8308e37014d'
            '40f8cf8246a790496fe906ee4eafb9d7')
build() {
  cd "$srcdir/$pkgname-$pkgver"
  make 
}
package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" PREFIX="/usr" SBINDIR="/usr/bin" install
  install -D -m644 ../inputlircd.conf "$pkgdir/etc/inputlircd.conf"
  install -D -m755 ../inputlircd.service "$pkgdir/usr/lib/systemd/system/inputlircd.service"
}
