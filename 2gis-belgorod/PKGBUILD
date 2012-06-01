# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>
     
pkgname=2gis-belgorod
pkgver=12
pkgrel=1
pkgdesc="Map of Belgorod for 2GIS, June 2012"
arch=('i686' 'x86_64')
url="http://belgorod.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.6.0.2')
source=("http://download.2gis.ru/arhives/2GISData_Belgorod-12.orig.zip")
md5sums=('642fcc137afd04c78d7470a585f48555')
     
build() {
     
   cd $startdir
     
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Belgorod.dgdat "${startdir}/pkg/opt/2gis/belgorod.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Belgorod.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Belgorod.dglf" || return 1
     
}

