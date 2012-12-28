pkgname=2gis-smolensk
pkgver=6
pkgrel=1
pkgdesc="Map of Smolensk for 2GIS, December 2012"
arch=('i686' 'x86_64')
url="http://smolensk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.12.0.2')
source=("http://download.2gis.ru/arhives/2GISData_Smolensk-6.orig.zip")
md5sums=('d8ab63563774126b8c49c7f95f1a92ed')

build() {
  cd $startdir
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Smolensk.dgdat "${startdir}/pkg/opt/2gis/smolensk.dgdat" || return 1
  
}
