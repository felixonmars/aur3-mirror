pkgname=2gis-smolensk
pkgver=9
pkgrel=1
pkgdesc="Map of Smolensk for 2GIS, March 2013"
arch=('i686' 'x86_64')
url="http://smolensk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.2.2')
source=("http://download.2gis.ru/arhives/2GISData_Smolensk-9.orig.zip")
md5sums=('8c037df632da7546f297dd4e1a12d0b2')

build() {
  cd $startdir
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Smolensk.dgdat "${startdir}/pkg/opt/2gis/smolensk.dgdat" || return 1
  
}
