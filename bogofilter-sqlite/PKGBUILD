# $Id$
# Maintainer: tobias <tobias@archlinux.org>
# Contributor: Low Kian Seong <fastmail_low@speedymail.org>

pkgname=bogofilter-sqlite
_pkgname=bogofilter
pkgver=1.2.2
pkgrel=1
pkgdesc="A fast Bayesian spam filtering tool"
arch=('i686' 'x86_64')
license=('GPL3')
url="http://bogofilter.sourceforge.net"
depends=('sqlite3' 'perl' 'gsl')
conflicts=('bogofilter')
backup=('etc/bogofilter/bogofilter.cf')
source=(http://sourceforge.net/projects/${_pkgname}/files/${_pkgname}-current/${_pkgname}-${pkgver}/${_pkgname}-${pkgver}.tar.bz2)
md5sums=('4bcabdf8c5e7efefcb508eda7e80eebc')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  ./configure --prefix=/usr \
              --sysconfdir=/etc/bogofilter  \
              --localstatedir=/var \
              --with-database=sqlite
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  mv "${pkgdir}/etc/bogofilter/bogofilter.cf.example" "${pkgdir}/etc/bogofilter/bogofilter.cf"

  install -dm755 "${pkgdir}/usr/share/${_pkgname}/contrib"
  install -m644 contrib/* "${pkgdir}/usr/share/${_pkgname}/contrib/"
}

