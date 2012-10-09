pkgname=2gis-smolensk
pkgver=4
pkgrel=1
pkgdesc="Map of Smolensk for 2GIS, October 2012"
arch=('i686' 'x86_64')
url="http://smolensk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.9.0.1')
source=("http://download.2gis.ru/arhives/2GISData_Smolensk-4.orig.zip")
md5sums=('3a485302d85d578625231611d2e862fa')

build() {
  cd $startdir
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Smolensk.dgdat "${startdir}/pkg/opt/2gis/smolensk.dgdat" || return 1
  
}
