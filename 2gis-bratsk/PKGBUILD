pkgname=2gis-bratsk
pkgver=9
pkgrel=1
pkgdesc="Map of Bratsk for 2GIS, June 2012"
arch=('i686' 'x86_64')
url="http://bratsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.6.0.2')
source=("http://download.2gis.ru/arhives/2GISData_Bratsk-9.orig.zip")
md5sums=('faaa6480407df2fd6dfeafe58f2c5bcd')

build() {
  cd $startdir
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Bratsk.dgdat "${startdir}/pkg/opt/2gis/bratsk.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Bratsk.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Bratsk.dglf" || return 1
}
