# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>
     
pkgname=2gis-ekaterinburg
pkgver=87
pkgrel=1
pkgdesc="Map of Ekaterinburg for 2GIS, March 2013"
arch=('i686' 'x86_64')
url="http://ekaterinburg.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.2.2')
source=("http://download.2gis.ru/arhives/2GISData_Ekaterinburg-87.orig.zip")
md5sums=('5400214c18c56d3da9a15b048e516ea2')
     
build() {
     
   cd $startdir
     
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Ekaterinburg.dgdat "${startdir}/pkg/opt/2gis/ekaterinburg.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Ekaterinburg.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Ekaterinburg.dglf" || return 1
     
}

