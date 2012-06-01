# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>
     
pkgname=2gis-vladivostok
pkgver=27
pkgrel=1
pkgdesc="Map of Vladivostok for 2GIS, June 2012"
arch=('i686' 'x86_64')
url="http://vladivostok.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.6.0.2')
source=("http://download.2gis.ru/arhives/2GISData_Vladivostok-27.orig.zip")
md5sums=('dfa1fc1d1c1500291706b598f9849a59')
     
build() {
     
   cd $startdir
     
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Vladivostok.dgdat "${startdir}/pkg/opt/2gis/vladivostok.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Vladivostok.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Vladivostok.dglf" || return 1
     
}

