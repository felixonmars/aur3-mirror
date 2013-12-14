pkgname=2gis-yakutsk
pkgver=28
pkgrel=1
pkgdesc="Map of Yakutsk for 2GIS, December 2013"
arch=('i686' 'x86_64')
url="http://yakutsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Yakutsk-28.orig.zip")
md5sums=('eaa785b9cb2b1c23eff1051378c318c0')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Yakutsk.dgdat" "${pkgdir}/opt/2gis/yakutsk.dgdat" || return 1
  
}
