# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>
     
pkgname=2gis-samara
pkgver=35
pkgrel=1
pkgdesc="Map of Samara for 2GIS"
arch=('i686' 'x86_64')
url="http://help.2gis.ru/linux/"
license=('custom')
depends=('2gis')
source=("http://download.2gis.ru/arhives/2GISData_Samara-${pkgver}.orig.zip")
md5sums=('627d8e3da8cabc6c3bb31f2a2961bfbe')
     
build() {
     
   cd $startdir
     
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Samara.dgdat "${startdir}/pkg/opt/2gis/samara.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Samara.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Samara.dglf" || return 1
     
}

