# Contributor: Nebulosa <nebulosa2007 na yandekse>

pkgname=2gis-magnitogorsk
pkgver=10
pkgrel=1
pkgdesc="Map of Magnitogorsk for 2GIS"
arch=('i686' 'x86_64')
url="http://help.2gis.ru/linux/"
license=('custom')
depends=('2gis')
source=("http://download.2gis.ru/arhives/2GISData_Magnitogorsk-${pkgver}.orig.zip")
md5sums=('9badcea0fcaf880af2294e09d5d53fbf')

build() {

  cd $startdir

# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Magnitogorsk.dgdat "${startdir}/pkg/opt/2gis/magnitogorsk.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Magnitogorsk.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Magnitogorsk.dglf" || return 1

}
