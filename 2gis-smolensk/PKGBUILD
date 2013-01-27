pkgname=2gis-smolensk
pkgver=7
pkgrel=1
pkgdesc="Map of Smolensk for 2GIS, January 2013"
arch=('i686' 'x86_64')
url="http://smolensk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.12.0.2')
source=("http://download.2gis.ru/arhives/2GISData_Smolensk-7.orig.zip")
md5sums=('1d6da6d3be546ba3086c5e72ef9f31d1')

build() {
  cd $startdir
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Smolensk.dgdat "${startdir}/pkg/opt/2gis/smolensk.dgdat" || return 1
  
}
