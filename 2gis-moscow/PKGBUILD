# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>
     
pkgname=2gis-moscow
pkgver=13
pkgrel=1
pkgdesc="Map of Moscow for 2GIS, May 2012"
arch=('i686' 'x86_64')
url="http://msk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.6.0.2')
source=("http://download.2gis.ru/arhives/2GISData_Moscow-${pkgver}.orig.zip")
md5sums=('903760e0702a2b477d3bc5ecd37ec2d8')
     
build() {
     
   cd $startdir
     
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Moscow.dgdat "${startdir}/pkg/opt/2gis/moscow.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Moscow.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Moscow.dglf" || return 1
     
}

