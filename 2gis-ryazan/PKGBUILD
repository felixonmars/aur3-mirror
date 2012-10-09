# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>
     
pkgname=2gis-ryazan
pkgver=18
pkgrel=1
pkgdesc="Map of Ryazan for 2GIS, October 2012"
arch=('i686' 'x86_64')
url="http://ryazan.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.9.0.1')
source=("http://download.2gis.ru/arhives/2GISData_Ryazan-18.orig.zip")
md5sums=('d070849f0d2bfc45de9add6d94f8dd9e')
     
build() {
     
   cd $startdir
     
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Ryazan.dgdat "${startdir}/pkg/opt/2gis/ryazan.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Ryazan.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Ryazan.dglf" || return 1
     
}

