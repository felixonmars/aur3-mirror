# Contributor: Nebulosa <nebulosa2007 na yandekse>

pkgname=2gis-barnaul
pkgver=73
pkgrel=1
pkgdesc="Map of Barnaul for 2GIS"
arch=('i686' 'x86_64')
url="http://help.2gis.ru/linux/"
license=('custom')
depends=('2gis')
source=("http://download.2gis.ru/arhives/2GISData_Barnaul-${pkgver}.orig.zip")
md5sums=('8b033c4d85e4ac7a9c1d44ef62db9a43')

build() {

  cd $startdir

# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Barnaul.dgdat "${startdir}/pkg/opt/2gis/barnaul.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Barnaul.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Barnaul.dglf" || return 1

}
