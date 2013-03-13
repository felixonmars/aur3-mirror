pkgname=2gis-stavropol
pkgver=15
pkgrel=1
pkgdesc="Map of Stavropol for 2GIS, March 2013"
arch=('i686' 'x86_64')
url="http://stavropol.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.2.2')
source=("http://download.2gis.ru/arhives/2GISData_Stavropol-15.orig.zip")
md5sums=('f3177bcfc1a9f4795f2e780cfd890398')

build() {
  cd $startdir
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Stavropol.dgdat "${startdir}/pkg/opt/2gis/stavropol.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Stavropol.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Stavropol.dglf" || return 1
}
