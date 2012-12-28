pkgname=2gis-sterlitamak
pkgver=13
pkgrel=1
pkgdesc="Map of Sterlitamak for 2GIS, December 2012"
arch=('i686' 'x86_64')
url="http://sterlitamak.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.12.0.2')
source=("http://download.2gis.ru/arhives/2GISData_Sterlitamak-13.orig.zip")
md5sums=('7b945aa06d15dc8113f9d0d41324ee29')

build() {
  cd $startdir
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Sterlitamak.dgdat "${startdir}/pkg/opt/2gis/sterlitamak.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Sterlitamak.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Sterlitamak.dglf" || return 1
}
