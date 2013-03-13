# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>
     
pkgname=2gis-tyumen
pkgver=76
pkgrel=1
pkgdesc="Map of Tyumen for 2GIS, March 2013"
arch=('i686' 'x86_64')
url="http://tyumen.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.2.2')
source=("http://download.2gis.ru/arhives/2GISData_Tyumen-76.orig.zip")
md5sums=('9df2f4aedb1900aad927cee84e28fb32')
     
build() {
     
   cd $startdir
     
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Tyumen.dgdat "${startdir}/pkg/opt/2gis/tyumen.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Tyumen.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Tyumen.dglf" || return 1
     
}

