# Contributor: Hugo Doria <hugo@archlinux.org>
# Contributor: Wilson Pinto Júnior <n3rd3x@guake-terminal.org>

pkgname=openlh-server
pkgver=0.2
pkgrel=2
pkgdesc="A Free OpenLanhouse Client, Server module"
arch=('i686' 'x86_64')
url="http://openlanhouse.org"
depends=('openlh-core' 'pygtk' 'gnome-python' 'python-sqlalchemy' 'xdg-utils')
makedepends=('intltool')
license=('GPL3')
source=(http://openlanhouse.org/releases/${pkgver}/${pkgname}-${pkgver}.tar.gz)
md5sums=('83f73617d24ac358ac7646fa5748738c')
install=${pkgname}.install

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR=${pkgdir} install
  
  install -m755 -d ${pkgdir}/usr/share/gconf/schemas
  gconf-merge-schema ${pkgdir}/usr/share/gconf/schemas/${pkgname}.schemas ${pkgdir}/etc/gconf/schemas/*.schemas
  rm -f ${pkgdir}/etc/gconf/schemas/*.schemas
}
