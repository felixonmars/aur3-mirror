# Contributor: Nebulosa <nebulosa2007 na yandekse>

pkgname=2gis-omsk
pkgver=79
pkgrel=1
pkgdesc="Map of Omsk for 2GIS"
arch=('i686' 'x86_64')
url="http://help.2gis.ru/linux/"
license=('custom')
depends=('2gis')
source=("http://download.2gis.ru/arhives/2GISData_Omsk-${pkgver}.orig.zip")
md5sums=('70aa3683c9281d56aa24753c4c5e03e5')

build() {

  cd $startdir

# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Omsk.dgdat "${startdir}/pkg/opt/2gis/omsk.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Omsk.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Omsk.dglf" || return 1

}
