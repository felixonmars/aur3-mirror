# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>

pkgname=2gis-spb
pkgver=16
pkgrel=2
pkgdesc="Map of Saint-Petersburg for 2GIS, June 2012"
arch=('i686' 'x86_64')
url="http://spb.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.6.0.2')
source=("http://download.2gis.ru/arhives/2GISData_Spb-16.orig.zip")
md5sums=('21e9d1561960bbc60ebf0caf592d8bd2')

build() {

   cd $startdir

# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Spb.dgdat "${startdir}/pkg/opt/2gis/spb.dgdat" || return 1
# There is no Spb.dglf file in 2GISData_Spb-15.org.zip
# install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Spb.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Spb.dglf" || return 1

}

