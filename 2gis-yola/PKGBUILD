pkgname=2gis-yola
pkgver=4
pkgrel=1
pkgdesc="Map of Yoshkar-Ola for 2GIS, August 2012"
arch=('i686' 'x86_64')
url="http://yola.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.7.0.0')
source=("http://download.2gis.ru/arhives/2GISData_Yoshkarola-4.orig.zip")
md5sums=('472e848320fe281b30d51441f2c6d7bc')

build() {
  cd $startdir
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Yoshkar-Ola.dgdat "${startdir}/pkg/opt/2gis/yola.dgdat" || return 1
  
}
