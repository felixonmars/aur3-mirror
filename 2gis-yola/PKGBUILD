pkgname=2gis-yola
pkgver=11
pkgrel=1
pkgdesc="Map of Yoshkar-Ola for 2GIS, March 2013"
arch=('i686' 'x86_64')
url="http://yola.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.2.2')
source=("http://download.2gis.ru/arhives/2GISData_Yoshkarola-11.orig.zip")
md5sums=('ce842f247271feaa36804d323a159f70')

build() {
  cd $startdir
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Yoshkar-Ola.dgdat "${startdir}/pkg/opt/2gis/yola.dgdat" || return 1
  
}
