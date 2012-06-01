pkgname=2gis-cheboksary
pkgver=8
pkgrel=1
pkgdesc="Map of Cheboksary for 2GIS, June 2012"
arch=('i686' 'x86_64')
url="http://cheboksary.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.6.0.2')
source=("http://download.2gis.ru/arhives/2GISData_Cheboksary-8.orig.zip")
md5sums=('0a94cb05c000d6880e78158af64e1d31')

build() {
  cd $startdir
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Cheboksary.dgdat "${startdir}/pkg/opt/2gis/cheboksary.dgdat" || return 1
  
}
