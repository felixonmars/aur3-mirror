# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>
     
pkgname=2gis-kurgan
pkgver=75
pkgrel=1
pkgdesc="Map of Kurgan for 2GIS, June 2012"
arch=('i686' 'x86_64')
url="http://kurgan.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.6.0.2')
source=("http://download.2gis.ru/arhives/2GISData_Kurgan-75.orig.zip")
md5sums=('8c673deca19cf7bd879a43a04f2591f7')
     
build() {
     
   cd $startdir
     
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Kurgan.dgdat "${startdir}/pkg/opt/2gis/kurgan.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Kurgan.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Kurgan.dglf" || return 1
     
}

