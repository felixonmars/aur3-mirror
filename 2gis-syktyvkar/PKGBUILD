pkgname=2gis-syktyvkar
pkgver=5
pkgrel=1
pkgdesc="Map of Syktyvkar for 2GIS, August 2012"
arch=('i686' 'x86_64')
url="http://syktyvkar.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.7.0.0')
source=("http://download.2gis.ru/arhives/2GISData_Syktyvkar-5.orig.zip")
md5sums=('1c18b2053c3fbb0c724e35c165d20386')

build() {
  cd $startdir
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Syktyvkar.dgdat "${startdir}/pkg/opt/2gis/syktyvkar.dgdat" || return 1
  
}
