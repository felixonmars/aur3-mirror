pkgname=2gis-yola
pkgver=7
pkgrel=1
pkgdesc="Map of Yoshkar-Ola for 2GIS, November 2012"
arch=('i686' 'x86_64')
url="http://yola.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.9.0.1')
source=("http://download.2gis.ru/arhives/2GISData_Yoshkarola-7.orig.zip")
md5sums=('eef78fc817eaacabe3a917a381ae2328')

build() {
  cd $startdir
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Yoshkar-Ola.dgdat "${startdir}/pkg/opt/2gis/yola.dgdat" || return 1
  
}
