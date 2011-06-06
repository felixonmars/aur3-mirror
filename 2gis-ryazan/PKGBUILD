# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>
     
pkgname=2gis-ryazan
pkgver=2
pkgrel=1
pkgdesc="Map of Ryazan for 2GIS"
arch=('i686' 'x86_64')
url="http://help.2gis.ru/linux/"
license=('custom')
depends=('2gis')
source=("http://download.2gis.ru/arhives/2GISData_Ryazan-${pkgver}.orig.zip")
md5sums=('d764c5f62641875ca0a9773f8eee42b3')
     
build() {
     
   cd $startdir
     
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Ryazan.dgdat "${startdir}/pkg/opt/2gis/ryazan.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Ryazan.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Ryazan.dglf" || return 1
     
}

