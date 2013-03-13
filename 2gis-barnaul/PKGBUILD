# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>
     
pkgname=2gis-barnaul
pkgver=97
pkgrel=1
pkgdesc="Map of Barnaul for 2GIS, March 2013"
arch=('i686' 'x86_64')
url="http://barnaul.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.2.2')
source=("http://download.2gis.ru/arhives/2GISData_Barnaul-97.orig.zip")
md5sums=('a3899032984a7cae89246c42af6b1f39')
     
build() {
     
   cd $startdir
     
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Barnaul.dgdat "${startdir}/pkg/opt/2gis/barnaul.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Barnaul.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Barnaul.dglf" || return 1
     
}

