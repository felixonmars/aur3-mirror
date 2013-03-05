# Maintainer: Sairon Istyar <saironiq@gmail.com>

pkgname=lib32-libgnutls26
pkgver=2.12.20
pkgrel=1
pkgdesc='gnutls26 library (shared objects)'
arch=('x86_64')
url="http://www.gnutls.org/"
license=(LGPLv3)

source=(http://ftp.debian.org/debian/pool/main/g/gnutls26/libgnutls26_2.12.20-4_i386.deb)
md5sums=('10da17fe0faee443c8f6feccd9f47035')

package() {
  ar vx $srcdir/libgnutls26_2.12.20-4_i386.deb
  tar xzvf $srcdir/data.tar.gz
  install -Dm755 $srcdir/usr/lib/i386-linux-gnu/libgnutls.so.26.22.4 $pkgdir/usr/lib32/libgnutls.so.26.22.4
  ln -s libgnutls.so.26.22.4 $pkgdir/usr/lib32/libgnutls.so.26
  install -Dm755 $srcdir/usr/lib/i386-linux-gnu/libgnutls-extra.so.26.22.4 $pkgdir/usr/lib32/libgnutls-extra.so.26.22.4
  ln -s libgnutls-extra.so.26.22.4 $pkgdir/usr/lib32/libgnutls-extra.so.26
}
