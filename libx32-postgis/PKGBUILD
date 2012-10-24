# $Id: PKGBUILD 76604 2012-09-24 14:48:24Z dan $
# Upstream Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org
# Contributor: William Rea <sillywilly@gmail.com>
# Maintainer: Fantix King <fantix.king at gmail.com>

_basepkgname=postgis
pkgname=libx32-postgis
pkgver=2.0.1
pkgrel=1
pkgdesc="Adds support for geographic objects to PostgreSQL (x32 ABI)"
arch=('x86_64')
url="http://postgis.org/"
license=('GPL')
depends=('binx32-postgresql>=9.2' 'binx32-postgresql<9.3' 'libx32-proj' 'libx32-geos' 'libx32-gdal' 'libx32-json-c' 'libx32-libxml2' "${_basepkgname}=${pkgver}")
changelog=$_basepkgname.changelog
options=('!libtool')
source=("http://postgis.org/download/${_basepkgname}-${pkgver}.tar.gz")
sha256sums=('32d181bbf0e648fe31c95b3dd23f7e4e49094d93cb4278fdf71c8feed4e9593c')

build() {
  cd "${srcdir}/${_basepkgname}-${pkgver}"

  export CC="gcc -mx32"
  export CXX="g++ -mx32"
  export PKG_CONFIG_PATH="/usr/libx32/pkgconfig"
  export CFLAGS="${CFLAGS} --include=/usr/include/cpl_port-x32.h"
  export CXXFLAGS="${CXXFLAGS} --include=/usr/include/geos/platform-x32.h"
  export PERL='/usr/bin/perl-x32'

  ./configure --prefix=/usr --libdir=/usr/libx32 \
    --with-geosconfig=/usr/bin/geos-x32-config \
    --with-gdalconfig=/usr/bin/gdal-config-x32 \
    --with-pgconfig=/usr/bin/pg_config-x32
  make

  # Build utils (FS#25836)
  cd utils
  make
}

package() {
  cd "${srcdir}/${_basepkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  cd utils
  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}/usr/"{bin,include,share}
}
