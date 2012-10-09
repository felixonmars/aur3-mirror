pkgname=2gis-sterlitamak
pkgver=11
pkgrel=1
pkgdesc="Map of Sterlitamak for 2GIS, October 2012"
arch=('i686' 'x86_64')
url="http://sterlitamak.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.9.0.1')
source=("http://download.2gis.ru/arhives/2GISData_Sterlitamak-11.orig.zip")
md5sums=('cc355b3f6861d646051034c4ec44d82d')

build() {
  cd $startdir
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Sterlitamak.dgdat "${startdir}/pkg/opt/2gis/sterlitamak.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Sterlitamak.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Sterlitamak.dglf" || return 1
}
