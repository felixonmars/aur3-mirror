# Maintainer: Hannes Gräuler <hgraeule@uos.de>
# Contributor: SaultDon <sault.don gmail>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org
# Contributor: William Rea <sillywilly@gmail.com>
pkgname=postgis-noraster
_pkgname=${pkgname%-noraster}
pkgver=2.1.4
pkgrel=1
pkgdesc="A slim postgis version without raster and SFCGAL support"
arch=('i686' 'x86_64')
url="http://postgis.net/"
license=('GPL')
depends=('postgresql' 'gdal' 'geos' 'json-c' 'libxml2' 'libxslt')
provides=("$_pkgname=$pkgver")
conflicts=($_pkgname)
source=("http://download.osgeo.org/postgis/source/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('cd73c2a38428c8736f6cae73b955aee0bd42f9ca4fd8d93c1af464524cb100fc')

build() {
  cd ${_pkgname}-${pkgver}

  ./configure --prefix=/usr --without-raster --without-sfcgal --with-gdalconfig=/usr/bin/gdal-config --with-gui
  make
}

package() {
  cd ${_pkgname}-${pkgver}

  make DESTDIR="${pkgdir}" install
}
