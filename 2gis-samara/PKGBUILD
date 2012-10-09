# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>
     
pkgname=2gis-samara
pkgver=51
pkgrel=1
pkgdesc="Map of Samara for 2GIS, October 2012"
arch=('i686' 'x86_64')
url="http://samara.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.9.0.1')
source=("http://download.2gis.ru/arhives/2GISData_Samara-51.orig.zip")
md5sums=('32f243678b0834000422285d62aa2e94')
     
build() {
     
   cd $startdir
     
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Samara.dgdat "${startdir}/pkg/opt/2gis/samara.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Samara.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Samara.dglf" || return 1
     
}

