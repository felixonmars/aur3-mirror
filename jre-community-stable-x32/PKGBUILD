# Maintainer: Oleg Chiruhin <hedin.pr AT gmail DOT com>
# Category: devel

pkgname=jre-community-stable-x32
shortname=jre
pkgver="6u26"
pkgrel="1"
pkgdesc="32bit version of J2SE Runtime Environment from stable community repo"
arch=("i686" "x86_64")
depends=(glibc)
makedepends=()
url="http://java.sun.com/javase/"
license="custom"
source=(ftp://ftp.archlinux.org/community/os/i686/$shortname-$pkgver-$pkgrel-i686.pkg.tar.xz)
md5sums=('35d02e2f6eed4eaca096063b645b4476')

build() {
 mkdir -p $pkgdir/opt/java-community-stable-x32
 cp -R $srcdir/opt/java/jre $pkgdir/opt/java-community-stable-x32
}
