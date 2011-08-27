# Contributor: <ahmad200512@yandex.ru>

pkgname=pxtools
pkgver=0.0.20
pkgrel=1
pkgdesc="Set of tools to convert a Paradox-database into a SQL-database (MySQL, PostgreSQL), CSV or XML"
arch=('i686' 'x86_64')
url="http://jan.kneschke.de/projects/pxtools"
source=("http://jan.kneschke.de/assets/2007/2/16/${pkgname}-${pkgver}.tar.gz")
license=('GPL')
depends=()
makedepends=('bison')
md5sums=('c68ee33366446bdcd7ab1852b15f98e5')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}
