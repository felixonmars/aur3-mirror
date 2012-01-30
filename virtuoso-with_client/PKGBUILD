# $Id: PKGBUILD 142435 2011-11-09 18:50:28Z andrea $
# Maintainer: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Massimiliano Torromeo <massimiliano DOT torromeo AT google mail service>
# Contributor: Filip Brcic <brcha@gna.org>

pkgname=virtuoso-with_client
_pkgname=virtuoso
pkgver=6.1.4
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc='A scalable cross-platform server that combines SQL/RDF/XML Data Management with Web Application Server and Web Services Platform functionality'
url='http://virtuoso.openlinksw.com/wiki/main/Main/'
license=('GPL')
depends=('libldap')
makedepends=('bison' 'flex')
conflicts=('virtuoso' 'virtuoso-cvs')
provides=('virtuoso')
options=('!libtool')
source=("http://downloads.sourceforge.net/${_pkgname}/${_pkgname}-opensource-${pkgver}.tar.gz")
md5sums=('7110a0b4b171b84850d346f4fe648172')

build() {
  cd ${srcdir}/${_pkgname}-opensource-${pkgver}

  ./configure --prefix=/usr \
    --localstatedir=/var \
    --sysconfdir=/etc \
    --disable-rendezvous \
    --disable-hslookup \
    --disable-all-vads
  make
}

package() {
  # install server
  cd ${srcdir}/${_pkgname}-opensource-${pkgver}/binsrc/virtuoso
  make DESTDIR=${pkgdir} install

  # install driver
  cd ${srcdir}/${_pkgname}-opensource-${pkgver}/binsrc/driver
  make DESTDIR=${pkgdir} install

  # install client
  cd ${srcdir}/${_pkgname}-opensource-${pkgver}/binsrc/tests
  make DESTDIR=${pkgdir} install

  # /usr/bin/isql{,w} conflicts with unixODBC, so rename them
  mv ${pkgdir}/usr/bin/isql{,-v}
  mv ${pkgdir}/usr/bin/isqlw{,-v}
}
