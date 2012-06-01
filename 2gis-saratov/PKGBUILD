# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>
     
pkgname=2gis-saratov
pkgver=14
pkgrel=1
pkgdesc="Map of Saratov for 2GIS, June 2012"
arch=('i686' 'x86_64')
url="http://saratov.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.6.0.2')
source=("http://download.2gis.ru/arhives/2GISData_Saratov-14.orig.zip")
md5sums=('4ee708201794e6a2b06c6b123869a0c9')
     
build() {
     
   cd $startdir
     
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Saratov.dgdat "${startdir}/pkg/opt/2gis/saratov.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Saratov.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Saratov.dglf" || return 1
     
}

