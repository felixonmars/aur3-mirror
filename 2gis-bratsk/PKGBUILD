pkgname=2gis-bratsk
pkgver=8
pkgrel=1
pkgdesc="Map of Bratsk for 2GIS, May 2012"
arch=('i686' 'x86_64')
url="http://bratsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.6.0.2')
source=("http://download.2gis.ru/arhives/2GISData_Bratsk-8.orig.zip")
md5sums=('10fa2c9a652398d36b0cca601d95c9b9')

build() {
  cd $startdir
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Bratsk.dgdat "${startdir}/pkg/opt/2gis/bratsk.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Bratsk.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Bratsk.dglf" || return 1
}
