# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=scala-actors-migration
pkgver=1.0.0
pkgrel=1
pkgdesc="Scala Actors Migration Kit"
arch=('any')
url="https://github.com/scala/actors-migration"
license=('Apache')
depends=('scala')
makedepends=('sbt')
options=(!emptydirs)

source=("https://github.com/scala/actors-migration/archive/v${pkgver}.tar.gz")
md5sums=('3ceb5d31609b0a0d5c7725cc00f1372b')

build() {
  cd "$srcdir/actors-migration-$pkgver"

  sbt -Dsbt.boot.directory="$srcdir/sbt-boot" -Dsbt.ivy.home="$srcdir/ivy-home" package
}

package() {
  cd "$srcdir/actors-migration-$pkgver"

  install -D "$srcdir/actors-migration-$pkgver/target/scala-2.10/scala-actors-migration_2.10-$pkgver.jar" "$pkgdir/usr/share/scala/lib/scala-actors-migration.jar"
}

