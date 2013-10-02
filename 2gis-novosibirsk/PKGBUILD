pkgname=2gis-novosibirsk
pkgver=181
pkgrel=1
pkgdesc="Map of Novosibirsk for 2GIS, October 2013"
arch=('i686' 'x86_64')
url="http://nsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.9.0')
source=("http://download.2gis.ru/arhives/2GISData_Novosibirsk-181.orig.zip")
md5sums=('f0c888d138ca0e865acdd192a5fa05c2')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Novosibirsk.dgdat" "${pkgdir}/opt/2gis/novosibirsk.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Novosibirsk.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/novosibirsk.dglf" || return 1
}
