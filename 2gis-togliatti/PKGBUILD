# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>
     
pkgname=2gis-togliatti
pkgver=36
pkgrel=1
pkgdesc="Map of Togliatti for 2GIS"
arch=('i686' 'x86_64')
url="http://help.2gis.ru/linux/"
license=('custom')
depends=('2gis')
source=("http://download.2gis.ru/arhives/2GISData_Togliatti-${pkgver}.orig.zip")
md5sums=('ae0341088f267fb54eeff03a97287c7f')
     
build() {
     
   cd $startdir
     
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Togliatti.dgdat "${startdir}/pkg/opt/2gis/togliatti.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Togliatti.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Togliatti.dglf" || return 1
     
}

