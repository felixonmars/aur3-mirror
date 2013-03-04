# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=scala-typesafe-config
pkgver=1.0.0
pkgrel=1
pkgdesc="Configuration library for JVM languages"
arch=('any')
url="https://github.com/typesafehub/config"
license=('Apache')
depends=('scala')
makedepends=('sbt')
options=(!emptydirs)

source=("https://github.com/typesafehub/config/archive/v${pkgver}.tar.gz")
md5sums=('9ab43e2584ff53a86501c492ee2a39a1')

build() {
  cd "$srcdir/config-$pkgver"

  sbt -Dsbt.boot.directory="$srcdir/sbt-boot" -Dsbt.ivy.home="$srcdir/ivy-home" package
}

package() {
  cd "$srcdir/config-$pkgver"

  install -D "$srcdir/config-$pkgver/config/target/config-$pkgver.jar" "$pkgdir/usr/share/scala/lib/typesafe-config.jar"
}

