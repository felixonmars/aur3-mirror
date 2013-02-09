pkgname=2gis-yola
pkgver=10
pkgrel=1
pkgdesc="Map of Yoshkar-Ola for 2GIS, February 2013"
arch=('i686' 'x86_64')
url="http://yola.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.12.0.2')
source=("http://download.2gis.ru/arhives/2GISData_Yoshkarola-10.orig.zip")
md5sums=('86504dd377b7d7a445406258b2040e6b')

build() {
  cd $startdir
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Yoshkar-Ola.dgdat "${startdir}/pkg/opt/2gis/yola.dgdat" || return 1
  
}
