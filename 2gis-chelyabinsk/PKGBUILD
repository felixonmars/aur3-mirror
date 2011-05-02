# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>

pkgname=2gis-chelyabinsk
pkgver=45
pkgrel=1
pkgdesc="Map of Chelyabinsk for 2GIS"
arch=('i686' 'x86_64')
url="http://help.2gis.ru/linux/"
license=('custom')
depends=('2gis')
source=("http://download.2gis.ru/arhives/2GISData_Chelyabinsk-${pkgver}.orig.zip")
md5sums=('ed683eb101721d73ab57923c143782d0')

build() {

  cd $startdir

# Installing to /opt/2gis
  install -D -m 645 ${startdir}/src/2gis/3.0/Data_Chelyabinsk.dgdat "${startdir}/pkg/opt/2gis/chelyabinsk.dgdat" || return 1
  install -D -m 645 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Chelyabinsk.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Chelyabinsk.dglf" || return 1

}
