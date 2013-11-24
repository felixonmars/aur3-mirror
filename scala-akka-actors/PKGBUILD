# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=scala-akka-actors
pkgver=2.2.3
pkgrel=1
pkgdesc="Toolkit and runtime for building highly concurrent, distributed, and fault tolerant event-driven applications on the JVM"
arch=('any')
url="http://akka.io/"
license=('Apache')
depends=('scala')
makedepends=('sbt')
options=(!emptydirs)

source=("https://github.com/akka/akka/archive/v$pkgver.tar.gz")
md5sums=('4226d63fa9902b1ddfa8d7dc74839469')

build() {
  cd "$srcdir/akka-$pkgver"

  sbt -Dsbt.boot.directory="$srcdir/sbt-boot" -Dsbt.ivy.home="$srcdir/ivy-home" package
}

package() {
  cd "$srcdir/akka-$pkgver"

  install -D "$srcdir/akka-$pkgver/akka-actor/target/akka-actor_2.10-$pkgver.jar" "$pkgdir/usr/share/scala/lib/akka-actors.jar"
}

