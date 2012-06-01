# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>
     
pkgname=2gis-astrakhan
pkgver=79
pkgrel=1
pkgdesc="Map of Astrakhan for 2GIS, June 2012"
arch=('i686' 'x86_64')
url="http://astrakhan.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.6.0.2')
source=("http://download.2gis.ru/arhives/2GISData_Astrakhan-79.orig.zip")
md5sums=('d5dcdfa05836bfecb1aee7214e6de488')
     
build() {
     
   cd $startdir
     
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Astrakhan.dgdat "${startdir}/pkg/opt/2gis/astrakhan.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Astrakhan.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Astrakhan.dglf" || return 1
     
}

