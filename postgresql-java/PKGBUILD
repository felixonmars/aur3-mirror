# Maintainer: Ecmel Ercan <ecmel dot ercan at gmail dot com>
pkgname=postgresql-java
_major=9.2
_minor=1000
pkgver=${_major}.${_minor}
pkgrel=2
pkgdesc="PostgreSQL Java libraries"
url="http://jdbc.postgresql.org/"
arch=('any')
license=('custom:PostgreSQL')
depends=(postgresql-libs)
options=(!strip !zipman)
source=(http://jdbc.postgresql.org/download/postgresql-${_major}-${_minor}.jdbc4.jar)
md5sums=('5001ccb39dea9bd74510d5d945a4aa3e')

package() {
  cd ${srcdir}

  install -m755 -d ${pkgdir}/usr/share/java
  install -m644 postgresql-${_major}-${_minor}.jdbc4.jar ${pkgdir}/usr/share/java/postgresql.jar
}

