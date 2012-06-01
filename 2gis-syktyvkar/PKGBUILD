pkgname=2gis-syktyvkar
pkgver=3
pkgrel=1
pkgdesc="Map of Syktyvkar for 2GIS, June 2012"
arch=('i686' 'x86_64')
url="http://syktyvkar.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.6.0.2')
source=("http://download.2gis.ru/arhives/2GISData_Syktyvkar-3.orig.zip")
md5sums=('0a85ef3be6762795b2cb38178abb6783')

build() {
  cd $startdir
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Syktyvkar.dgdat "${startdir}/pkg/opt/2gis/syktyvkar.dgdat" || return 1
  
}
