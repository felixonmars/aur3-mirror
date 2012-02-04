# Maintainer: Billy Yanez <bemonio AT gmail DOT com>
# Category: devel

pkgname=lib32-jre
pkgname32=jre
pkgver="6u25"
pkgrel="1"
pkgdesc="32bit version of J2SE Runtime Environment"
arch=('x86_64')
depends=(lib32-glibc)
makedepends=()
url="http://java.sun.com/javase/6/"
groups=lib32
license="custom"
source=(ftp://ftp.archlinux.org/community/os/i686/$pkgname32-$pkgver-$pkgrel-i686.pkg.tar.xz)
md5sums=('d725fd4968b32da93143e90bd13a2642')

build() {
 mkdir -p $pkgdir/opt/java32
 cp -R $srcdir/opt/java/jre $pkgdir/opt/java32
}
