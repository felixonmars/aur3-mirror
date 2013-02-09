pkgname=2gis-arkhangelsk
pkgver=18
pkgrel=1
pkgdesc="Map of Arkhangelsk for 2GIS, February 2013"
arch=('i686' 'x86_64')
url="http://arkhangelsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.12.0.2')
source=("http://download.2gis.ru/arhives/2GISData_Arkhangelsk-18.orig.zip")
md5sums=('77b74125ca268efe428186d5e40efda8')

build() {
  cd $startdir
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Arkhangelsk.dgdat "${startdir}/pkg/opt/2gis/arkhangelsk.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Arkhangelsk.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Arkhangelsk.dglf" || return 1
}
