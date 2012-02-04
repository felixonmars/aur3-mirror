# Contributor: Peter Feigl <craven@gmx.net>

pkgname=lifelines
pkgver=3.0.62
pkgrel=1
pkgdesc="A genealogy software system"
arch=('i686' 'x86_64')
license=('GPL')
depends=('perl')
url="http://lifelines.sourceforge.net"
source=(http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.gz)

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr/ || return 1
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
}

md5sums=('ff617e64205763c239b0805d8bbe19fe')
