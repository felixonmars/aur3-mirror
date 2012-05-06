pkgname=2gis-syktyvkar
pkgver=2
pkgrel=1
pkgdesc="Map of Syktyvkar for 2GIS, May 2012"
arch=('i686' 'x86_64')
url="http://syktyvkar.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.6.0.2')
source=("http://download.2gis.ru/arhives/2GISData_Syktyvkar-2.orig.zip")
md5sums=('01648b06e0a59c0e1fb9c5f836cb3526')

build() {
  cd $startdir
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Syktyvkar.dgdat "${startdir}/pkg/opt/2gis/syktyvkar.dgdat" || return 1
  
}
