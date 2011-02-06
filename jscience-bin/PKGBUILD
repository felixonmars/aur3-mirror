# Contributor: Andreas Hauser <andy-aur@splashground.de>
pkgname=jscience-bin
pkgver=4.1.2
pkgrel=1
pkgdesc="among other things a reference implementation for measures and units (JSR-275)"
arch=(x86_64)
url="http://jscience.org/"
license="BSD"
depends=(jre javolution)
conflicts=(jscience)
provides=(jscience)
source=(http://jscience.org/jscience-$pkgver-bin.zip)

build() {
  cd $startdir/src
  mkdir -p $startdir/pkg/usr/share/java
  mv ${pkgname/-bin/}-4.1 $startdir/pkg/usr/share/java/${pkgname/-bin/}
  cd $startdir/pkg/usr/share/java
  ln -s ${pkgname/-bin/}/${pkgname/-bin/}.jar .
}

md5sums=('19a32aa945af95741676598f7b208306')
