# Contributor: Jed Brown <jed@59A2.org>
pkgname=padb
pkgver=3.3
pkgrel=1
pkgdesc="Parallel Application Debugger"
url="http://padb.pittman.org.uk"
license=('LGPL')
depends=('perl')
arch=('i686' 'x86_64')
source=(http://${pkgname}.googlecode.com/files/${pkgname}-${pkgver}.tar.gz)
md5sums=('2a3354ef0244a48b1cc28d917fd00ad3')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
  make DESTDIR=$pkgdir install
}
