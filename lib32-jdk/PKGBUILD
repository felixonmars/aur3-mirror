# Maintainer: Billy Yanez <bemonio AT gmail DOT com>
# Category: devel

pkgname=lib32-jdk
pkgname32=jdk
pkgver="6u25"
pkgrel="1"
pkgdesc="32bit version of J2SE Development Kit"
arch=('x86_64')
depends=(lib32-glibc lib32-jre)
makedepends=()
url="http://java.sun.com/javase/6/"
groups=lib32
license="custom"
source=(ftp://ftp.archlinux.org/community/os/i686/$pkgname32-$pkgver-$pkgrel-i686.pkg.tar.xz)
md5sums=('43147bdcfd89162218c19938444fd1da')

build() {
  mkdir -p $pkgdir/opt/java32
  cp -R $srcdir/opt/java/* $pkgdir/opt/java32/
}
