pkgname=2gis-kaluga
pkgver=10
pkgrel=1
pkgdesc="Map of Kaluga for 2GIS, December 2012"
arch=('i686' 'x86_64')
url="http://kaluga.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.12.0.2')
source=("http://download.2gis.ru/arhives/2GISData_Kaluga-10.orig.zip")
md5sums=('4d63df7d18a9a5ad24734723b389caba')

build() {
  cd $startdir
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Kaluga.dgdat "${startdir}/pkg/opt/2gis/kaluga.dgdat" || return 1
  
}
