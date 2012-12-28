pkgname=2gis-ivanovo
pkgver=8
pkgrel=1
pkgdesc="Map of Ivanovo for 2GIS, December 2012"
arch=('i686' 'x86_64')
url="http://ivanovo.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.12.0.2')
source=("http://download.2gis.ru/arhives/2GISData_Ivanovo-8.orig.zip")
md5sums=('f57c1219c64310076e0e6c5bbf0254ae')

build() {
  cd $startdir
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Ivanovo.dgdat "${startdir}/pkg/opt/2gis/ivanovo.dgdat" || return 1
  
}
