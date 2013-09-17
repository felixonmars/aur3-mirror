pkgname=2gis-lipetsk
pkgver=22
pkgrel=1
pkgdesc="Map of Lipetsk for 2GIS, September 2013"
arch=('i686' 'x86_64')
url="http://lipetsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Lipetsk-22.orig.zip")
md5sums=('639f94757df52ce43e72d2a272ebff47')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Lipetsk.dgdat" "${pkgdir}/opt/2gis/lipetsk.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Lipetsk.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/lipetsk.dglf" || return 1
}
