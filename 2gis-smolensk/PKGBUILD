pkgname=2gis-smolensk
pkgver=1
pkgrel=1
pkgdesc="Map of Smolensk for 2GIS, July 2012"
arch=('i686' 'x86_64')
url="http://smolensk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.7.0.0')
source=("http://download.2gis.ru/arhives/2GISData_Smolensk-1.orig.zip")
md5sums=('0cc99f775a5de8454a4650a307e2c17d')

build() {
  cd $startdir
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Smolensk.dgdat "${startdir}/pkg/opt/2gis/smolensk.dgdat" || return 1
  
}
