# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>
     
pkgname=2gis-krasnodar
pkgver=29
pkgrel=1
pkgdesc="Map of Krasnodar for 2GIS, June 2012"
arch=('i686' 'x86_64')
url="http://krasnodar.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.6.0.2')
source=("http://download.2gis.ru/arhives/2GISData_Krasnodar-29.orig.zip")
md5sums=('99098d796fbaadef027a965af999eb21')
     
build() {
     
   cd $startdir
     
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Krasnodar.dgdat "${startdir}/pkg/opt/2gis/krasnodar.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Krasnodar.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Krasnodar.dglf" || return 1
     
}

