# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>
     
pkgname=2gis-magnitogorsk
pkgver=25
pkgrel=1
pkgdesc="Map of Magnitogorsk for 2GIS, May 2012"
arch=('i686' 'x86_64')
url="http://magnitogorsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.6.0.2')
source=("http://download.2gis.ru/arhives/2GISData_Magnitogorsk-${pkgver}.orig.zip")
md5sums=('0e03eb2760513928b05672806cf29445')
     
build() {
     
   cd $startdir
     
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Magnitogorsk.dgdat "${startdir}/pkg/opt/2gis/magnitogorsk.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Magnitogorsk.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Magnitogorsk.dglf" || return 1
     
}

