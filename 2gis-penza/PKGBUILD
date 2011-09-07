# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>
     
pkgname=2gis-penza
pkgver=5
pkgrel=1
pkgdesc="Map of Penza for 2GIS"
arch=('i686' 'x86_64')
url="http://help.2gis.ru/linux/"
license=('custom')
depends=('2gis')
source=("http://download.2gis.ru/arhives/2GISData_Penza-${pkgver}.orig.zip")
md5sums=('40f2f65cc7db3ec14a1d1e1332017834')
     
build() {
     
   cd $startdir
     
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Penza.dgdat "${startdir}/pkg/opt/2gis/penza.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Penza.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Penza.dglf" || return 1
     
}

