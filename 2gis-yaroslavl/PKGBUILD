# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>

pkgname=2gis-yaroslavl
pkgver=10
pkgrel=1
pkgdesc="Map of Yaroslavl for 2GIS"
arch=('i686' 'x86_64')
url="http://help.2gis.ru/linux/"
license=('custom')
depends=('2gis')
source=("http://download.2gis.ru/arhives/2GISData_Yaroslavl-${pkgver}.orig.zip")
md5sums=('0df050bbb189cd5648478e66e0bd78f7')

build() {

  cd $startdir

# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Yaroslavl.dgdat "${startdir}/pkg/opt/2gis/yaroslavl.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Yaroslavl.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Yaroslavl.dglf" || return 1

}

