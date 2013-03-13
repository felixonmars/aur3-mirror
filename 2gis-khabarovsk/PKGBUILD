# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>
     
pkgname=2gis-khabarovsk
pkgver=28
pkgrel=1
pkgdesc="Map of Khabarovsk for 2GIS, March 2013"
arch=('i686' 'x86_64')
url="http://khabarovsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.2.2')
source=("http://download.2gis.ru/arhives/2GISData_Khabarovsk-28.orig.zip")
md5sums=('9c94a85265af34b35487af435241cdb7')
     
build() {
     
   cd $startdir
     
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Khabarovsk.dgdat "${startdir}/pkg/opt/2gis/khabarovsk.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Khabarovsk.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Khabarovsk.dglf" || return 1
     
}

