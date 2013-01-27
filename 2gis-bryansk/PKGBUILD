pkgname=2gis-bryansk
pkgver=11
pkgrel=1
pkgdesc="Map of Bryansk for 2GIS, January 2013"
arch=('i686' 'x86_64')
url="http://bryansk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.12.0.2')
source=("http://download.2gis.ru/arhives/2GISData_Bryansk-11.orig.zip")
md5sums=('4ddfc35dfd1c9acc8cd60aa0bf081344')

build() {
  cd $startdir
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Bryansk.dgdat "${startdir}/pkg/opt/2gis/bryansk.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Bryansk.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Bryansk.dglf" || return 1
}
