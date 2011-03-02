# Contributor: Nebulosa <nebulosa2007 na yandekse>

pkgname=2gis-vladivostok
pkgver=12
pkgrel=1
pkgdesc="Map of Vladivostok for 2GIS"
arch=('i686' 'x86_64')
url="http://help.2gis.ru/linux/"
license=('custom')
depends=('2gis')
source=("http://download.2gis.ru/arhives/2GISData_Vladivostok-${pkgver}.orig.zip")
md5sums=('5199178ffc2b27605bd857e5d7b7714f')

build() {

  cd $startdir

# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Vladivostok.dgdat "${startdir}/pkg/opt/2gis/vladivostok.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Vladivostok.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Vladivostok.dglf" || return 1

}
