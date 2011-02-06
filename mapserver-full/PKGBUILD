pkgname=mapserver-full
pkgver=5.4.2
pkgrel=1
pkgdesc="Platform for publishing spatial data and interactive mapping applications to the web"
arch=(i686 x86_64)
license=('MIT')
url="http://www.mapserver.org"
depends=('libpng' 'freetype2' 'gd' 'zlib' 'gdal' 'proj' 'libjpeg' 'libxml2' 'libpqxx' 'pdflib-lite' 'geos' 'agg' 'php' 'apache')
replaces=('mapserver')
makedepends=('cfitsio')
options=()
source=("http://download.osgeo.org/mapserver/mapserver-$pkgver.tar.gz")
md5sums=('7c58bb90f5003fcfaec4320cc652a669')

build() {
  cd ${startdir}/src/mapserver-${pkgver}

  ./configure   --with-ogr=/usr/bin/gdal-config \
                --with-gdal=/usr/bin/gdal-config \
                --with-httpd=/usr/sbin/httpd \
                --with-curl-config=/usr/bin/curl-config \
                --with-proj=/usr \
                --with-tiff \
                --with-gd=/usr \
                --with-jpeg \
                --with-png \
                --with-freetype=/usr/ \
                --with-threads \
                --with-wcs \
                --with-wfsclient \
                --with-wmsclient \
                --with-libiconv=/usr \
                --with-postgis=/usr/bin/pg_config \
                --with-geos=/usr/bin/geos-config \
                --with-xml2-config=/usr/bin/xml2-config \
                --with-sos \
                --with-agg \
		        --with-php=/usr \
                --enable-debug || return 1

  make || return 1
  mkdir -p ${startdir}/pkg/usr/bin || return 1
  install -m755 legend ${startdir}/pkg/usr/bin/legend || return 1
  install -m755 msencrypt ${startdir}/pkg/usr/bin/msencrypt || return 1
  install -m755 mapserv ${startdir}/pkg/usr/bin/mapserv || return 1
  install -m755 mapserver-config ${startdir}/pkg/usr/bin/mapserver-config || return 1
  install -m755 scalebar ${startdir}/pkg/usr/bin/scalebar || return 1
  install -m755 shp2img ${startdir}/pkg/usr/bin/scalebar || return 1
  install -m755 shp2mysql.pl ${startdir}/pkg/usr/bin/shp2mysql.pl || return 1
  install -m755 shp2pdf ${startdir}/pkg/usr/bin/shp2pdf || return 1
  install -m755 shptree ${startdir}/pkg/usr/bin/shptree || return 1
  install -m755 shptreetst ${startdir}/pkg/usr/bin/shptreetst || return 1
  install -m755 shptreevis ${startdir}/pkg/usr/bin/shptreevis || return 1
  install -m755 sortshp ${startdir}/pkg/usr/bin/shptreevis || return 1
  install -m755 tile4ms ${startdir}/pkg/usr/bin/tile4ms || return 1

  mkdir -p ${startdir}/pkg/usr/lib/php/20060613 || return 1
  install -m755 mapscript/php3/php_mapscript.so ${startdir}/pkg/usr/lib/php/20060613
}

# To compile with Arcgis SDE Support:
#   --with-sde-version=90 \
#   --with-sde=/usr/sde/sdeexe90 \


