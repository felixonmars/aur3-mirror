# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>
     
pkgname=2gis-saratov
pkgver=13
pkgrel=1
pkgdesc="Map of Saratov for 2GIS, May 2012"
arch=('i686' 'x86_64')
url="http://saratov.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.6.0.2')
source=("http://download.2gis.ru/arhives/2GISData_Saratov-${pkgver}.orig.zip")
md5sums=('02a9118f2a53ffcc69a2ccaa13f91065')
     
build() {
     
   cd $startdir
     
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Saratov.dgdat "${startdir}/pkg/opt/2gis/saratov.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Saratov.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Saratov.dglf" || return 1
     
}

