pkgname=2gis-yola
pkgver=3
pkgrel=1
pkgdesc="Map of Yoshkar-Ola for 2GIS, July 2012"
arch=('i686' 'x86_64')
url="http://yola.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.6.0.2')
source=("http://download.2gis.ru/arhives/2GISData_Yoshkarola-3.orig.zip")
md5sums=('264ce7d1c972d695511169b554a7f441')

build() {
  cd $startdir
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Yoshkar-Ola.dgdat "${startdir}/pkg/opt/2gis/yola.dgdat" || return 1
  
}
