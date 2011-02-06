# Contributor Nebulosa nebulosa2007 na yandexe

pkgname=2gis-vladivostok
pkgver=11
pkgrel=1
pkgdesc="Map of Vladivostok for 2GIS"
arch=('i686' 'x86_64')
url="http://help.2gis.ru/linux/"
license=('custom')
depends=('2gis')
source=("http://download.2gis.ru/arhives/2GISData_Vladivostok-${pkgver}.orig.zip")
md5sums=('0496dcd3a1232c19337280ff405bb477')

build() {

  cd $startdir

# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Vladivostok.dgdat "${startdir}/pkg/opt/2gis/vladivostok.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Vladivostok.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Vladivostok.dglf" || return 1

}
