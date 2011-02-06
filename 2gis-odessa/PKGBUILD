# Contributor: stanislaw <i@archuser.pp.ru>

pkgname=2gis-odessa
pkgver=48
pkgrel=1
pkgdesc="Map of Odessa for 2GIS"
arch=('i686' 'x86_64')
url="http://help.2gis.ru/linux/"
license=('custom')
depends=('2gis')
source=("http://download.2gis.ru/arhives/2GISData_Odessa-${pkgver}.orig.zip")
md5sums=('969f3f5e76fd734990172a9c055b2bc4')

build() {

  cd $startdir

# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Odessa.dgdat "${startdir}/pkg/opt/2gis/odessa.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Odessa.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Odessa.dglf" || return 1

}
