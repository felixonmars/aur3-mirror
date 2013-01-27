pkgname=2gis-blag
pkgver=16
pkgrel=1
pkgdesc="Map of Blagoveschensk for 2GIS, January 2013"
arch=('i686' 'x86_64')
url="http://blag.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.12.0.2')
source=("http://download.2gis.ru/arhives/2GISData_Blagoveshensk-16.orig.zip")
md5sums=('f935d8f6b861219adc585385ce142122')

build() {
  cd $startdir
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Blagoveschensk.dgdat "${startdir}/pkg/opt/2gis/blag.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Blagoveschensk.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Blagoveschensk.dglf" || return 1
}
