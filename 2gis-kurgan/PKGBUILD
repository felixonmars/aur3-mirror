# Contributor: Nebulosa <nebulosa2007 na yandekse>

pkgname=2gis-kurgan
pkgver=60
pkgrel=1
pkgdesc="Map of Kurgan for 2GIS"
arch=('i686' 'x86_64')
url="http://help.2gis.ru/linux/"
license=('custom')
depends=('2gis')
source=("http://download.2gis.ru/arhives/2GISData_Kurgan-${pkgver}.orig.zip")
md5sums=('87c63e61fc355f12dcaca2e58eda50b4')

build() {

  cd $startdir

# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Kurgan.dgdat "${startdir}/pkg/opt/2gis/kurgan.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Kurgan.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Kurgan.dglf" || return 1

}
