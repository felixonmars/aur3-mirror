# $Id$
# Maintainer: Fabián E. Gallina <galli.87@gmail.com>

pkgname=postgis1
pkgver=1.5.8
pkgrel=1
pkgdesc="Adds support for geographic objects to PostgreSQL"
arch=('i686' 'x86_64')
url="http://postgis.org/"
license=('GPL')
depends=('postgresql>=8.4' 'postgresql<9.3' 'proj' 'geos')
options=('!libtool')
source=("http://download.osgeo.org/postgis/source/postgis-${pkgver}.tar.gz")
sha256sums=('4896fdae2f814b88c3ca458b7d01d7eca7e9aca021599c817919f131a1b0d804')
provides=('postgis')
conflicts=('postgis')

build() {
  cd ${srcdir}/postgis-${pkgver}

  ./configure --prefix=/usr
  make

  # Build utils (FS#25836)
  cd utils
  make
}

package() {
  cd ${srcdir}/postgis-${pkgver}
  make DESTDIR=${pkgdir} install
}
