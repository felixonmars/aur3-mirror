# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>
     
pkgname=2gis-barnaul
pkgver=91
pkgrel=1
pkgdesc="Map of Barnaul for 2GIS, September 2012"
arch=('i686' 'x86_64')
url="http://barnaul.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.9.0.1')
source=("http://download.2gis.ru/arhives/2GISData_Barnaul-91.orig.zip")
md5sums=('72fbf728b59e3254f6b9b1d7675ec64e')
     
build() {
     
   cd $startdir
     
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Barnaul.dgdat "${startdir}/pkg/opt/2gis/barnaul.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Barnaul.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Barnaul.dglf" || return 1
     
}

