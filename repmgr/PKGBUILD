# Maintainer: carloratm <carlo.ratm@gmail.com>
pkgname=repmgr
pkgver=1.2.0
pkgrel=1
pkgdesc="Replication Manager for PostgreSQL"
arch=('i686' 'x86_64')
url="http://www.repmgr.org"
license=('GPL3')
depends=('rsync' 'postgresql>=9.0')
source=("http://www.repmgr.org/download/${pkgname}-${pkgver}.tar.gz")
md5sums=('f8b03ec1a2277823d64c2fb1bf26730b')
install=

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make USE_PGXS=1
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -d ${pkgdir}/usr/bin
  make USE_PGXS=1 DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
