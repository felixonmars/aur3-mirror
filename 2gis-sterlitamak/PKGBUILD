pkgname=2gis-sterlitamak
pkgver=14
pkgrel=1
pkgdesc="Map of Sterlitamak for 2GIS, January 2013"
arch=('i686' 'x86_64')
url="http://sterlitamak.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.12.0.2')
source=("http://download.2gis.ru/arhives/2GISData_Sterlitamak-14.orig.zip")
md5sums=('f14d63e6bef81ac5b1f3e22953dea0e7')

build() {
  cd $startdir
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Sterlitamak.dgdat "${startdir}/pkg/opt/2gis/sterlitamak.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Sterlitamak.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Sterlitamak.dglf" || return 1
}
