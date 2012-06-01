# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>
     
pkgname=2gis-nnovgorod
pkgver=45
pkgrel=1
pkgdesc="Map of Nizhny Novgorod for 2GIS, June 2012"
arch=('i686' 'x86_64')
url="http://nnovgorod.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.6.0.2')
source=("http://download.2gis.ru/arhives/2GISData_N_Novgorod-45.orig.zip")
md5sums=('c91864fc986c3f6292a1e48139ee3d7c')
     
build() {
     
   cd $startdir
     
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_N_Novgorod.dgdat "${startdir}/pkg/opt/2gis/nnovgorod.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/N_Novgorod.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/N_Novgorod.dglf" || return 1
     
}

