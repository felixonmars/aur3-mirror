# Maintainer: Sairon Istyar <saironiq@gmail.com>

pkgname=lib32-gsasl
pkgver=1.8.0
pkgrel=1
pkgdesc='32-bit gsasl library (shared objects)'
arch=('x86_64')
url="https://www.gnu.org/software/gsasl/"
license=(LGPLv2.1)

source=(http://ftp.debian.org/debian/pool/main/g/gsasl/libgsasl7_1.8.0-2_i386.deb)
md5sums=('510ff86341b5c0cef8c4a6aa03b865aa')

package() {
  ar vx $srcdir/libgsasl7_1.8.0-2_i386.deb
  tar xzvf $srcdir/data.tar.gz
  install -Dm755 $srcdir/usr/lib/libgsasl.so.7.9.6 $pkgdir/usr/lib32/libgsasl.so.7.9.6
  ln -s libgsasl.so.7.9.6 $pkgdir/usr/lib32/libgsasl.so.7
}
