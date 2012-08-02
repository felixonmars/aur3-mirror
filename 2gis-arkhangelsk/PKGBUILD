pkgname=2gis-arkhangelsk
pkgver=12
pkgrel=1
pkgdesc="Map of Arkhangelsk for 2GIS, August 2012"
arch=('i686' 'x86_64')
url="http://arkhangelsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.7.0.0')
source=("http://download.2gis.ru/arhives/2GISData_Arkhangelsk-12.orig.zip")
md5sums=('cd987126b66314bd7d62171970846009')

build() {
  cd $startdir
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Arkhangelsk.dgdat "${startdir}/pkg/opt/2gis/arkhangelsk.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Arkhangelsk.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Arkhangelsk.dglf" || return 1
}
