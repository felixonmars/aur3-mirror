# Contributor: stanislaw <i@archuser.pp.ru>

pkgname=2gis-krasnodar
pkgver=13
pkgrel=1
pkgdesc="Map of Krasnodar for 2GIS"
arch=('i686' 'x86_64')
url="http://help.2gis.ru/linux/"
license=('custom')
depends=('2gis')
source=("http://download.2gis.ru/arhives/2GISData_Krasnodar-${pkgver}.orig.zip")
md5sums=('e106b97eb840799fc1e5dff3d9b441db')

build() {

  cd $startdir

# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Kransodar.dgdat "${startdir}/pkg/opt/2gis/kransodar.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Krasnodar.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Kransodar.dglf" || return 1

}
