# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>
     
pkgname=2gis-nnovgorod
pkgver=34
pkgrel=1
pkgdesc="Map of N_Novgorod for 2GIS"
arch=('i686' 'x86_64')
url="http://help.2gis.ru/linux/"
license=('custom')
depends=('2gis')
source=("http://download.2gis.ru/arhives/2GISData_N_Novgorod-${pkgver}.orig.zip")
md5sums=('e075820bcc2f2206c70ec8667325eea9')
     
build() {
     
   cd $startdir
     
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_N_Novgorod.dgdat "${startdir}/pkg/opt/2gis/nnovgorod.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/N_Novgorod.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/N_Novgorod.dglf" || return 1
     
}

