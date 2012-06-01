# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>
     
pkgname=2gis-ryazan
pkgver=14
pkgrel=1
pkgdesc="Map of Ryazan for 2GIS, June 2012"
arch=('i686' 'x86_64')
url="http://ryazan.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.6.0.2')
source=("http://download.2gis.ru/arhives/2GISData_Ryazan-14.orig.zip")
md5sums=('23b9cb6aaa2444b8e57388e17489b13f')
     
build() {
     
   cd $startdir
     
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Ryazan.dgdat "${startdir}/pkg/opt/2gis/ryazan.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Ryazan.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Ryazan.dglf" || return 1
     
}

