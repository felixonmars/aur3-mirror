# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>
     
pkgname=2gis-volgograd
pkgver=21
pkgrel=1
pkgdesc="Map of Volgograd for 2GIS, June 2012"
arch=('i686' 'x86_64')
url="http://volgograd.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.6.0.2')
source=("http://download.2gis.ru/arhives/2GISData_Volgograd-21.orig.zip")
md5sums=('267a7477c62ba08dfc2b53285bc1c032')
     
build() {
     
   cd $startdir
     
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Volgograd.dgdat "${startdir}/pkg/opt/2gis/volgograd.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Volgograd.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Volgograd.dglf" || return 1
     
}

