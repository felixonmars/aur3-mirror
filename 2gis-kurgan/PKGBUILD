# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>
     
pkgname=2gis-kurgan
pkgver=65
pkgrel=1
pkgdesc="Map of Kurgan for 2GIS"
arch=('i686' 'x86_64')
url="http://help.2gis.ru/linux/"
license=('custom')
depends=('2gis')
source=("http://download.2gis.ru/arhives/2GISData_Kurgan-${pkgver}.orig.zip")
md5sums=('b8dfde54ca9c16af7bd153f3043e1974')
     
build() {
     
   cd $startdir
     
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Kurgan.dgdat "${startdir}/pkg/opt/2gis/kurgan.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Kurgan.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Kurgan.dglf" || return 1
     
}

