# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>
     
pkgname=2gis-samara
pkgver=47
pkgrel=1
pkgdesc="Map of Samara for 2GIS, June 2012"
arch=('i686' 'x86_64')
url="http://samara.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.6.0.2')
source=("http://download.2gis.ru/arhives/2GISData_Samara-47.orig.zip")
md5sums=('a3ecf3b9aa37b4c11050488abe43eade')
     
build() {
     
   cd $startdir
     
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Samara.dgdat "${startdir}/pkg/opt/2gis/samara.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Samara.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Samara.dglf" || return 1
     
}

