# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>
     
pkgname=2gis-ryazan
pkgver=13
pkgrel=1
pkgdesc="Map of Ryazan for 2GIS, May 2012"
arch=('i686' 'x86_64')
url="http://ryazan.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.6.0.2')
source=("http://download.2gis.ru/arhives/2GISData_Ryazan-${pkgver}.orig.zip")
md5sums=('60aef6798fdd852d3cb9dac1ae41fd34')
     
build() {
     
   cd $startdir
     
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Ryazan.dgdat "${startdir}/pkg/opt/2gis/ryazan.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Ryazan.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Ryazan.dglf" || return 1
     
}

