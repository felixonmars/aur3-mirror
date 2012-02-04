# Contributor: Florian Richter <Florian_Richter@gmx.de>
pkgname=jakarta-commons-pool
pkgver=1.3
pkgrel=1
pkgdesc="provoids Object-pooling API for Java"
arch=(i686 x86_64)
url="http://jakarta.apache.org/commons/pool/"
license="APACHE"
depends=(jre)
makedepends=()
conflicts=()
replaces=()
source=(ftp://ftp-stud.fht-esslingen.de/pub/Mirrors/ftp.apache.org/dist/commons/pool/binaries/commons-pool-$pkgver.tar.gz)
md5sums=('1bdae6c015689349b704daebda924a5b')
sha1sums=('da038aad0312e15f11678fa086d902cb6c945b66')

build() {
  mkdir -p $startdir/pkg/usr/share/java/jakarta-commons-pool/
  cp $startdir/src/commons-pool-$pkgver/commons-pool-$pkgver.jar\
    $startdir/pkg/usr/share/java/jakarta-commons-pool/
  ln -s commons-pool-$pkgver.jar $startdir/pkg/usr/share/java/jakarta-commons-pool/commons-pool.jar
}

