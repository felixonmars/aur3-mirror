# Contributor: Leif Warner <abimelech@gmail.com>
pkgname=simple-build-tool
pkgver=0.12.0
pkgrel=1
pkgdesc="SBT: a Scala build tool"
arch=(any)
url="http://code.google.com/p/simple-build-tool/"
license=('BSD')
depends=('java-environment')

source=(http://typesafe.artifactoryonline.com/typesafe/ivy-releases/org.scala-sbt/sbt-launch/$pkgver/sbt-launch.jar
        https://raw.github.com/harrah/xsbt/$pkgver/LICENSE
        sbt.sh)
noextract=('sbt-launch.jar')

md5sums=('69c2f0cdf38cfb1ca35dd3cbd8f18b2f'
         '0cc49331142988765ce73782a5839c57'
         '1b09b6567cddd38c8d37c86da6215335')

build() {
  cd "$srcdir"
  install -D -m644 sbt-launch.jar "$pkgdir/usr/share/java/sbt-launch.jar"
  install -D -m755 sbt.sh "$pkgdir/usr/bin/sbt"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
