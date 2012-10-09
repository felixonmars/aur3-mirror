pkgname=2gis-yola
pkgver=6
pkgrel=1
pkgdesc="Map of Yoshkar-Ola for 2GIS, October 2012"
arch=('i686' 'x86_64')
url="http://yola.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.9.0.1')
source=("http://download.2gis.ru/arhives/2GISData_Yoshkarola-6.orig.zip")
md5sums=('9fe4238a1fb85ce9d64585d9dee5a00a')

build() {
  cd $startdir
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Yoshkar-Ola.dgdat "${startdir}/pkg/opt/2gis/yola.dgdat" || return 1
  
}
