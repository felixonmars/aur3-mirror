pkgname=2gis-smolensk
pkgver=2
pkgrel=1
pkgdesc="Map of Smolensk for 2GIS, August 2012"
arch=('i686' 'x86_64')
url="http://smolensk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.7.0.0')
source=("http://download.2gis.ru/arhives/2GISData_Smolensk-2.orig.zip")
md5sums=('022f7d18f8f0b776bc886ae68c134917')

build() {
  cd $startdir
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Smolensk.dgdat "${startdir}/pkg/opt/2gis/smolensk.dgdat" || return 1
  
}
