# Maintainer: Sairon Istyar <saironiq@gmail.com>
# Modified by: Bryan Hyshka <bryan@hyshka.com>

pkgname=lib32-libtasn1-3
pkgver=2.13
pkgrel=1
pkgdesc='tasn1-3 library (shared objects)'
arch=('x86_64')
url="https://www.gnu.org/software/libtasn1/"
license=(LGPLv2.1)

source=(http://ftp.debian.org/debian/pool/main/libt/libtasn1-3/libtasn1-3_2.13-2_i386.deb)
md5sums=('64fd75240d2f4c46f5977e57d7727265')

package() {
  ar vx $srcdir/libtasn1-3_2.13-2_i386.deb
  tar xzvf $srcdir/data.tar.gz
  install -Dm755 $srcdir/usr/lib/i386-linux-gnu/libtasn1.so.3.1.16 $pkgdir/usr/lib32/libtasn1.so.3.1.16
  ln -s libtasn1.so.3.1.16 $pkgdir/usr/lib32/libtasn1.so.3
}
