pkgname=2gis-yola
pkgver=1
pkgrel=1
pkgdesc="Map of Yoshkar-Ola for 2GIS, May 2012"
arch=('i686' 'x86_64')
url="http://yola.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.6.0.2')
source=("http://download.2gis.ru/arhives/2GISData_Yoshkarola-1.orig.zip")
md5sums=('7a0fb04b989d569fd8722756bf703a74')

build() {
  cd $startdir
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Yoshkar-Ola.dgdat "${startdir}/pkg/opt/2gis/yola.dgdat" || return 1
  
}
