# Contributor: Nebulosa <nebulosa2007 na yandekse>

pkgname=2gis-nnovgorod
pkgver=30
pkgrel=1
pkgdesc="Map of N_Novgorod for 2GIS"
arch=('i686' 'x86_64')
url="http://help.2gis.ru/linux/"
license=('custom')
depends=('2gis')
source=("http://download.2gis.ru/arhives/2GISData_N_Novgorod-${pkgver}.orig.zip")
md5sums=('61afb13f5444dcf26a5f60c34e230356')

build() {

  cd $startdir

# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_N_Novgorod.dgdat "${startdir}/pkg/opt/2gis/nnovgorod.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/N_Novgorod.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/N_Novgorod.dglf" || return 1

}
