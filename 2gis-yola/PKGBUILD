pkgname=2gis-yola
pkgver=9
pkgrel=1
pkgdesc="Map of Yoshkar-Ola for 2GIS, January 2013"
arch=('i686' 'x86_64')
url="http://yola.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.12.0.2')
source=("http://download.2gis.ru/arhives/2GISData_Yoshkarola-9.orig.zip")
md5sums=('a84381f96c5ad1c82830b001bab2c41e')

build() {
  cd $startdir
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Yoshkar-Ola.dgdat "${startdir}/pkg/opt/2gis/yola.dgdat" || return 1
  
}
