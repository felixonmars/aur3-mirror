pkgname=2gis-bryansk
pkgver=7
pkgrel=1
pkgdesc="Map of Bryansk for 2GIS, September 2012"
arch=('i686' 'x86_64')
url="http://bryansk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.9.0.1')
source=("http://download.2gis.ru/arhives/2GISData_Bryansk-7.orig.zip")
md5sums=('6e76d8550939af6446fc09df703835bc')

build() {
  cd $startdir
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Bryansk.dgdat "${startdir}/pkg/opt/2gis/bryansk.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Bryansk.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Bryansk.dglf" || return 1
}
