# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>
     
pkgname=2gis-ekaterinburg
pkgver=82
pkgrel=1
pkgdesc="Map of Ekaterinburg for 2GIS, October 2012"
arch=('i686' 'x86_64')
url="http://ekaterinburg.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.9.0.1')
source=("http://download.2gis.ru/arhives/2GISData_Ekaterinburg-82.orig.zip")
md5sums=('8464b8dee1335f74ffc5eaa566aafb35')
     
build() {
     
   cd $startdir
     
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Ekaterinburg.dgdat "${startdir}/pkg/opt/2gis/ekaterinburg.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Ekaterinburg.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Ekaterinburg.dglf" || return 1
     
}

