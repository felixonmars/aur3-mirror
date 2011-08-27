# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>
     
pkgname=2gis-kostroma
pkgver=10
pkgrel=1
pkgdesc="Map of Kostroma for 2GIS"
arch=('i686' 'x86_64')
url="http://help.2gis.ru/linux/"
license=('custom')
depends=('2gis')
source=("http://download.2gis.ru/arhives/2GISData_Kostroma-${pkgver}.orig.zip")
md5sums=('5e1aabc29c5f352f61d24bf5e30ca428')
     
build() {
     
   cd $startdir
     
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Kostroma.dgdat "${startdir}/pkg/opt/2gis/kostroma.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Kostroma.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Kostroma.dglf" || return 1
     
}

