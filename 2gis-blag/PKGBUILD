pkgname=2gis-blag
pkgver=14
pkgrel=1
pkgdesc="Map of Blagoveschensk for 2GIS, November 2012"
arch=('i686' 'x86_64')
url="http://blag.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.9.0.1')
source=("http://download.2gis.ru/arhives/2GISData_Blagoveshensk-14.orig.zip")
md5sums=('7f75e43de493d77cf095178803209a8f')

build() {
  cd $startdir
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Blagoveschensk.dgdat "${startdir}/pkg/opt/2gis/blag.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Blagoveschensk.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Blagoveschensk.dglf" || return 1
}
