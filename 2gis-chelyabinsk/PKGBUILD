# Contributor: Nebulosa <nebulosa2007 na yandekse>

pkgname=2gis-chelyabinsk
pkgver=43
pkgrel=1
pkgdesc="Map of Chelyabinsk for 2GIS"
arch=('i686' 'x86_64')
url="http://help.2gis.ru/linux/"
license=('custom')
depends=('2gis')
source=("http://download.2gis.ru/arhives/2GISData_Chelyabinsk-${pkgver}.orig.zip")
md5sums=('6e49827f6cfe90d556e5fa3f16080cea')

build() {

  cd $startdir

# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Chelyabinsk.dgdat "${startdir}/pkg/opt/2gis/chelyabinsk.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Chelyabinsk.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Chelyabinsk.dglf" || return 1

}
