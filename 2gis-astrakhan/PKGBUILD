# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>
     
pkgname=2gis-astrakhan
pkgver=88
pkgrel=1
pkgdesc="Map of Astrakhan for 2GIS, March 2013"
arch=('i686' 'x86_64')
url="http://astrakhan.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.2.2')
source=("http://download.2gis.ru/arhives/2GISData_Astrakhan-88.orig.zip")
md5sums=('c13ee7e961b85477f3271a24f2509d9f')
     
build() {
     
   cd $startdir
     
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Astrakhan.dgdat "${startdir}/pkg/opt/2gis/astrakhan.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Astrakhan.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Astrakhan.dglf" || return 1
     
}

