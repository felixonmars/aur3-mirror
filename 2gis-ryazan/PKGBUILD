# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>
     
pkgname=2gis-ryazan
pkgver=23
pkgrel=1
pkgdesc="Map of Ryazan for 2GIS, March 2013"
arch=('i686' 'x86_64')
url="http://ryazan.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.2.2')
source=("http://download.2gis.ru/arhives/2GISData_Ryazan-23.orig.zip")
md5sums=('3eecd46ecb1fc95562ec952c0a52c4af')
     
build() {
     
   cd $startdir
     
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Ryazan.dgdat "${startdir}/pkg/opt/2gis/ryazan.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Ryazan.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Ryazan.dglf" || return 1
     
}

