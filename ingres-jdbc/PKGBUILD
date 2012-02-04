# Contributor: John Gerritse <reaphsharc@gmail.com>
pkgname=ingres-jdbc
pkgver=3.4.7
pkgrel=1
pkgdesc="The official JDBC driver for Ingres 9.2."
arch=('i686' 'x86_64')
url="http://esd.ingres.com/product/Community_Projects/Drivers/java/JDBC"
license=('GPL2')
depends=('jre')
makedepends=()
source=(http://98.129.177.132/~jKEZrG/iijdbc-9.2-v${pkgver}.zip)
md5sums=('3cb8c55f4d54438550836e6f6b5526c6')
build() {
  install -D -m644 "$startdir/src/iijdbc.jar" "$startdir/pkg/usr/share/java/ingres-jdbc/iijdbc.jar"

}

# vim:set ts=2 sw=2 et:
