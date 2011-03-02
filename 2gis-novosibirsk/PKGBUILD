# Contributor: Nebulosa <nebulosa2007 na yandekse>

pkgname=2gis-novosibirsk
pkgver=150
pkgrel=1
pkgdesc="Map of Novosibirsk for 2GIS"
arch=('i686' 'x86_64')
url="http://help.2gis.ru/linux/"
license=('custom')
depends=('2gis')
source=("http://download.2gis.ru/arhives/2GISData_Novosibirsk-${pkgver}.orig.zip")
md5sums=('d02d2c5711d4a5de1863a909b911d760')

build() {

  cd $startdir

# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Novosibirsk.dgdat "${startdir}/pkg/opt/2gis/novosibirsk.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Novosibirsk.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Novosibirsk.dglf" || return 1

}
