# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>
     
pkgname=2gis-belgorod
pkgver=15
pkgrel=1
pkgdesc="Map of Belgorod for 2GIS, September 2012"
arch=('i686' 'x86_64')
url="http://belgorod.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.9.0.1')
source=("http://download.2gis.ru/arhives/2GISData_Belgorod-15.orig.zip")
md5sums=('fd15995bf8cde31152a6d30e1b919933')
     
build() {
     
   cd $startdir
     
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Belgorod.dgdat "${startdir}/pkg/opt/2gis/belgorod.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Belgorod.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Belgorod.dglf" || return 1
     
}

