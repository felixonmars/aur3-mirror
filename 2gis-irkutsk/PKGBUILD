# Contributor: Nebulosa <nebulosa2007 na yandekse>

pkgname=2gis-irkutsk
pkgver=59
pkgrel=1
pkgdesc="Map of Irkutsk for 2GIS"
arch=('i686' 'x86_64')
url="http://help.2gis.ru/linux/"
license=('custom')
depends=('2gis')
source=("http://download.2gis.ru/arhives/2GISData_Irkutsk-${pkgver}.orig.zip")
md5sums=('929e2e0df323d8c7cb31419b1137d5fc')

build() {

  cd $startdir

# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Irkutsk.dgdat "${startdir}/pkg/opt/2gis/irkutsk.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Irkutsk.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Irkutsk.dglf" || return 1

}
