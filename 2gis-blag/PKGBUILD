pkgname=2gis-blag
pkgver=10
pkgrel=1
pkgdesc="Map of Blagoveschensk for 2GIS, July 2012"
arch=('i686' 'x86_64')
url="http://blag.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.6.0.2')
source=("http://download.2gis.ru/arhives/2GISData_Blagoveshensk-10.orig.zip")
md5sums=('033e5c6b58761ff1e29febbb27ca670f')

build() {
  cd $startdir
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Blagoveschensk.dgdat "${startdir}/pkg/opt/2gis/blag.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Blagoveschensk.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Blagoveschensk.dglf" || return 1
}
