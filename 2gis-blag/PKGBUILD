pkgname=2gis-blag
pkgver=13
pkgrel=1
pkgdesc="Map of Blagoveschensk for 2GIS, October 2012"
arch=('i686' 'x86_64')
url="http://blag.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.9.0.1')
source=("http://download.2gis.ru/arhives/2GISData_Blagoveshensk-13.orig.zip")
md5sums=('4c7129bcf06baaaeb0cf0c5733179142')

build() {
  cd $startdir
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Blagoveschensk.dgdat "${startdir}/pkg/opt/2gis/blag.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Blagoveschensk.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Blagoveschensk.dglf" || return 1
}
