pkgname=2gis-smolensk
pkgver=8
pkgrel=1
pkgdesc="Map of Smolensk for 2GIS, February 2013"
arch=('i686' 'x86_64')
url="http://smolensk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.12.0.2')
source=("http://download.2gis.ru/arhives/2GISData_Smolensk-8.orig.zip")
md5sums=('6bc86d243a8a911c14c4ecc17f73a150')

build() {
  cd $startdir
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Smolensk.dgdat "${startdir}/pkg/opt/2gis/smolensk.dgdat" || return 1
  
}
