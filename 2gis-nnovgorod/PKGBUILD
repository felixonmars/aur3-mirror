# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>

pkgname=2gis-nnovgorod
pkgver=32
pkgrel=1
pkgdesc="Map of Nizhny Novgorod for 2GIS"
arch=('i686' 'x86_64')
url="http://help.2gis.ru/linux/"
license=('custom')
depends=('2gis')
source=("http://download.2gis.ru/arhives/2GISData_N_Novgorod-${pkgver}.orig.zip")
md5sums=('5b5e406a65a8c00fa1c78b99258482fb')

build() {

  cd $startdir

# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_N_Novgorod.dgdat "${startdir}/pkg/opt/2gis/nnovgorod.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/N_Novgorod.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/N_Novgorod.dglf" || return 1

}
