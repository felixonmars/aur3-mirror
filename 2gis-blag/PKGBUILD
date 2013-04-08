pkgname=2gis-blag
pkgver=19
pkgrel=2
pkgdesc="Map of Blagoveschensk for 2GIS, April 2013"
arch=('i686' 'x86_64')
url="http://blag.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.2.2')
source=("http://download.2gis.ru/arhives/2GISData_Blagoveshensk-19.orig.zip")
md5sums=('38f9c377f2f360ec02cd5eb1753151a2')

package() {
  install -D -m 644 ${srcdir}/2gis/3.0/Data_Blagoveschensk.dgdat "${pkgdir}/opt/2gis/blag.dgdat" || return 1
  install -D -m 644 ${srcdir}/2gis/3.0/Plugins/DGisLan/Blagoveschensk.dglf "${pkgdir}/opt/2gis/Plugins/DGisLan/Blagoveschensk.dglf" || return 1
}
