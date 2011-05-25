# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>

pkgname=2gis-ulanude
pkgver=4
pkgrel=1
pkgdesc="Map of Ulanude for 2GIS"
arch=('i686' 'x86_64')
url="http://help.2gis.ru/linux/"
license=('custom')
depends=('2gis')
source=("http://download.2gis.ru/arhives/2GISData_Ulanude-${pkgver}.orig.zip")
md5sums=('7234ad3e7627e38e752e21f1522dce56')

build() {

  cd $startdir

# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/4.0/Data_Ulanude.dgdat "${startdir}/pkg/opt/2gis/ulanude.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/4.0/Plugins/DGisLan/Ulanude.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Ulanude.dglf" || return 1

}
