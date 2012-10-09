pkgname=2gis-syktyvkar
pkgver=7
pkgrel=1
pkgdesc="Map of Syktyvkar for 2GIS, October 2012"
arch=('i686' 'x86_64')
url="http://syktyvkar.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.9.0.1')
source=("http://download.2gis.ru/arhives/2GISData_Syktyvkar-7.orig.zip")
md5sums=('765db7e2be87ecacb3f5cc2d76d3e9c9')

build() {
  cd $startdir
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Syktyvkar.dgdat "${startdir}/pkg/opt/2gis/syktyvkar.dgdat" || return 1
  
}
