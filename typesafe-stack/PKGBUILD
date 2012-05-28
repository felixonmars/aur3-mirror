# Maintainer: Jamie Webb <aur@digitalice.co.uk>
pkgname=typesafe-stack
pkgver=2.0.2
pkgrel=1
epoch=
pkgdesc="SBT and Giter8 stubs for building Scala, Akka and Play projects"
arch=(any)
url="http://typesafe.com/stack"
license=('BSD3')
groups=()
depends=(java-runtime)
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=(sbt)
replaces=()
backup=()
options=()
install=
changelog=
source=("http://downloads.typesafe.com/typesafe-stack/${pkgver}/${pkgname}-${pkgver}.tgz")
md5sums=('114163a050f010ed213124db8d2910e8')
noextract=()

package() {
  cd "$srcdir/typesafe-stack"
  mkdir -p "$pkgdir/usr/bin"
  cp bin/{g8,giter8.properties,sbt,sbt-launch.jar,sbt-launch-lib.bash} "$pkgdir/usr/bin"
  chmod 0755 "$pkgdir/usr/bin/"{g8,sbt}
  chmod 0644 "$pkgdir/usr/bin/"{giter8.properties,sbt-launch.jar,sbt-launch-lib.bash}
}

# vim:set ts=2 sw=2 et:
