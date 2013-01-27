# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>
     
pkgname=2gis-nabchelny
pkgver=31
pkgrel=1
pkgdesc="Map of Naberezhnye Chelny for 2GIS, January 2013"
arch=('i686' 'x86_64')
url="http://nchelny.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.12.0.2')
source=("http://download.2gis.ru/arhives/2GISData_Nabchelny-31.orig.zip")
md5sums=('e4a0820fac8869f52047d1e9dcf2fe4f')
     
build() {
     
   cd $startdir
     
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Nabchelny.dgdat "${startdir}/pkg/opt/2gis/nabchelny.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Nabchelny.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Nabchelny.dglf" || return 1
     
}

