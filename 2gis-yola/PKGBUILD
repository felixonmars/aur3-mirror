pkgname=2gis-yola
pkgver=5
pkgrel=1
pkgdesc="Map of Yoshkar-Ola for 2GIS, September 2012"
arch=('i686' 'x86_64')
url="http://yola.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.9.0.1')
source=("http://download.2gis.ru/arhives/2GISData_Yoshkarola-5.orig.zip")
md5sums=('017c01435ed9c6499254e6599bd30a6a')

build() {
  cd $startdir
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Yoshkar-Ola.dgdat "${startdir}/pkg/opt/2gis/yola.dgdat" || return 1
  
}
