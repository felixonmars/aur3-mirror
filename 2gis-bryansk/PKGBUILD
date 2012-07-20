pkgname=2gis-bryansk
pkgver=5
pkgrel=1
pkgdesc="Map of Bryansk for 2GIS, July 2012"
arch=('i686' 'x86_64')
url="http://bryansk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.6.0.2')
source=("http://download.2gis.ru/arhives/2GISData_Bryansk-5.orig.zip")
md5sums=('521dc28b67262da5620833dcfe254532')

build() {
  cd $startdir
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Bryansk.dgdat "${startdir}/pkg/opt/2gis/bryansk.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Bryansk.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Bryansk.dglf" || return 1
}
