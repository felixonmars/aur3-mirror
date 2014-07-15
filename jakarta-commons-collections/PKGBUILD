# Contributor: Florian Richter <Florian_Richter@gmx.de>
pkgname=jakarta-commons-collections
pkgver=3.2.1
pkgrel=2
pkgdesc="Advanced Collection handling and more for Java"
arch=(i686 x86_64)
url="http://jakarta.apache.org/commons/collections/index.html"
license="APACHE"
depends=(java-runtime)
makedepends=()
conflicts=()
replaces=()
source=(ftp://ftp-stud.fht-esslingen.de/pub/Mirrors/ftp.apache.org/dist/commons/collections/binaries/commons-collections-$pkgver-bin.tar.gz)
md5sums=('6f5b078f01dd0c3910cc04898bf39924')

build() {
  mkdir -p $pkgdir/usr/share/java/jakarta-commons-collections/
  cp $srcdir/commons-collections-$pkgver/commons-collections-$pkgver.jar\
    $pkgdir/usr/share/java/jakarta-commons-collections/
  ln -s jakarta-commons-collections/commons-collections-$pkgver.jar $pkgdir/usr/share/java/commons-collections.jar
}


