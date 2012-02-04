# Maintainer: Oleg Chiruhin <hedin.pr AT gmail DOT com>
# Category: devel

pkgname=jdk-community-stable-x64
shortname=jdk
pkgver="6u26"
pkgrel="1"
pkgdesc="64bit version of J2SE Development Kit from stable community repo"
arch=("i686" "x86_64")
depends=(glibc jre-community-stable-x64)
makedepends=()
url="http://java.sun.com/javase/"
license="custom"
source=(ftp://ftp.archlinux.org/community/os/x86_64/$shortname-$pkgver-$pkgrel-x86_64.pkg.tar.xz)
md5sums=('511950e6c159d81b01b74cc6e8e39e07')

build() {
  mkdir -p $pkgdir/opt/java-community-stable-x64
  cp -R $srcdir/opt/java/* $pkgdir/opt/java-community-stable-x64/
}
