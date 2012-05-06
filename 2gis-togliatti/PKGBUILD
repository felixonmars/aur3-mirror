# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>
     
pkgname=2gis-togliatti
pkgver=46
pkgrel=1
pkgdesc="Map of Togliatti for 2GIS, May 2012"
arch=('i686' 'x86_64')
url="http://tlt.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.6.0.2')
source=("http://download.2gis.ru/arhives/2GISData_Togliatti-${pkgver}.orig.zip")
md5sums=('0694a66bcfe26a8437e544c85cfe5e20')
     
build() {
     
   cd $startdir
     
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Togliatti.dgdat "${startdir}/pkg/opt/2gis/togliatti.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Togliatti.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Togliatti.dglf" || return 1
     
}

