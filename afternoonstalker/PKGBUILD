# $Id: PKGBUILD 69845 2010-02-23 01:15:53Z eric $
# Maintainer: Gerson E. Ruotolo <gersonruotolo@globo.com>
# Contributor: Gerson E. Ruotolo <gersonruotolo@globo.com>

pkgname=afternoonstalker
pkgver=1.1.4
pkgrel=1
pkgdesc="Afternoon Stalker is a clone of the 1981 Intellivision game Night Stalker. "
arch=('i686' 'x86_64')
url="http://perso.b2b2c.ca/sarrazip/dev/afternoonstalker.html"
license=('GPL')
depends=('flatzebra>=0.1.5')
makedepends=('flatzebra>=0.1.5')
options=('!libtool' '!emptydirs')
source=(http://perso.b2b2c.ca/sarrazip/dev/${pkgname}-${pkgver}.tar.gz)
md5sums=('547a85977df795750c85729ba137a358')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
   ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
  }
