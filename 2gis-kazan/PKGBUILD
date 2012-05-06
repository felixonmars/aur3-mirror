# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>
     
pkgname=2gis-kazan
pkgver=42
pkgrel=1
pkgdesc="Map of Kazan for 2GIS, May 2012"
arch=('i686' 'x86_64')
url="http://kazan.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.6.0.2')
source=("http://download.2gis.ru/arhives/2GISData_Kazan-${pkgver}.orig.zip")
md5sums=('f352cc804792e74c657054e94d827bbf')
     
build() {
     
   cd $startdir
     
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Kazan.dgdat "${startdir}/pkg/opt/2gis/kazan.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Kazan.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Kazan.dglf" || return 1
     
}

