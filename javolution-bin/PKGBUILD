# Contributor: Andreas Hauser <andy-aur@splashground.de>
pkgname=javolution-bin
pkgver=5.1.0
pkgrel=1
pkgdesc="fast real-time implementations of some Java standard library parts"
arch=(x86_64)
url="http://javolution.org/"
license="BSD"
depends=(jre)
conflicts=(javolution)
provides=(javolution)
source=(http://javolution.org/javolution-$pkgver-bin.zip)

build() {
  cd $startdir/src
  mkdir -p $startdir/pkg/usr/share/java
  mv ${pkgname/-bin/}-5.1 $startdir/pkg/usr/share/java/${pkgname/-bin/}
  cd $startdir/pkg/usr/share/java
  ln -s ${pkgname/-bin/}/${pkgname/-bin/}.jar .
}

md5sums=('cdfcfe3d85a50ee1bd46e25abe1651e3')
