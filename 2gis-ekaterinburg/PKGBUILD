# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>

pkgname=2gis-ekaterinburg
pkgver=65
pkgrel=1
pkgdesc="Map of Ekaterinburg for 2GIS"
arch=('i686' 'x86_64')
url="http://help.2gis.ru/linux/"
license=('custom')
depends=('2gis')
source=("http://download.2gis.ru/arhives/2GISData_Ekaterinburg-${pkgver}.orig.zip")
md5sums=('93e97c481e946220d1e20eaeebc47f78')

build() {

  cd $startdir

# Installing to /opt/2gis
  install -D -m 654 ${startdir}/src/2gis/3.0/Data_Ekaterinburg.dgdat "${startdir}/pkg/opt/2gis/ekaterinburg.dgdat" || return 1
  install -D -m 654 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Ekaterinburg.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Ekaterinburg.dglf" || return 1

}
