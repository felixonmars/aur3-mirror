pkgname=2gis-lipetsk
pkgver=12
pkgrel=1
pkgdesc="Map of Lipetsk for 2GIS, November 2012"
arch=('i686' 'x86_64')
url="http://lipetsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.9.0.1')
source=("http://download.2gis.ru/arhives/2GISData_Lipetsk-12.orig.zip")
md5sums=('a6c195b6e82d80c55d6770bff6a0d72b')

build() {
  cd $startdir
# Installing to /opt/2gis
  install -D -m 644 ${startdir}/src/2gis/3.0/Data_Lipetsk.dgdat "${startdir}/pkg/opt/2gis/lipetsk.dgdat" || return 1
  install -D -m 644 ${startdir}/src/2gis/3.0/Plugins/DGisLan/Lipetsk.dglf "${startdir}/pkg/opt/2gis/Plugins/DGisLan/Lipetsk.dglf" || return 1
}
