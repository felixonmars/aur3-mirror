# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>
     
pkgname=2gis-izhevsk
pkgver=14
pkgrel=1
pkgdesc="Map of Izhevsk for 2GIS, May 2012"
arch=('i686' 'x86_64')
url="http://izhevsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.6.0.2')
source=("http://download.2gis.ru/arhives/2GISData_Izhevsk-${pkgver}.orig.zip")
md5sums=('6679d1cbba1b6f70f758d50af16199d0')
     
build() {
     
   cd $startdir
     
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Izhevsk.dgdat "${startdir}/pkg/opt/2gis/izhevsk.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Izhevsk.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Izhevsk.dglf" || return 1
     
}

