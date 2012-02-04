# Contributor: Niklas Schmuecker (IRC: nisc) <nschmuecker (gmail)>
# This workaround is probably too haxy to go somewhere else ;-)
# But it works ..

pkgname=gtetrinet-donotflood
pkgver=0.7.11
pkgrel=1
pkgdesc="GTetrinet with do_not_flood workaround (bug on tetrinet.de server)"
arch=(i686 x86_64)
license=('GPL')
depends=('libgnomeui>=2.18.1-2')
makedepends=('perlxml' 'pkgconfig')
conflicts=('gtetrinet')
replaces='gtetrinet'
provides=('gtetrinet')
install=gtetrinet.install
url="http://gtetrinet.sourceforge.net/"
source=(http://ftp.gnome.org/pub/GNOME/sources/gtetrinet/0.7/gtetrinet-${pkgver}.tar.bz2 do_not_flood.patch)
md5sums=('7d113e49506e44b836ce6f259fd3ad88'
         '9313a121b2ece1bab97699356f17c645')  

build() {
  cd ${startdir}/src/gtetrinet-${pkgver}
  patch -p1 < ../do_not_flood.patch || return 1
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  sed -i -e 's/games$/bin/g' src/Makefile || return 1
  make || return 1
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR=${startdir}/pkg install

  mkdir -p ${startdir}/pkg/usr/share/gconf/schemas
  gconf-merge-schema ${startdir}/pkg/usr/share/gconf/schemas/gtetrinet.schemas ${startdir}/pkg/etc/gconf/schemas/*.schemas
  rm -f ${startdir}/pkg/etc/gconf/schemas/*.schemas
}
