# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>
     
pkgname=2gis-nabchelny
pkgver=15
pkgrel=1
pkgdesc="Map of Nabchelny for 2GIS"
arch=('i686' 'x86_64')
url="http://help.2gis.ru/linux/"
license=('custom')
depends=('2gis')
source=("http://download.2gis.ru/arhives/2GISData_Nabchelny-${pkgver}.orig.zip")
md5sums=('d7a95a4f1cc04d2b905ce24b18eb3384')
     
build() {
     
   cd $startdir
     
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Nabchelny.dgdat "${startdir}/pkg/opt/2gis/nabchelny.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Nabchelny.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Nabchelny.dglf" || return 1
     
}

