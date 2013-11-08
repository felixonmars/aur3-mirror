pkgname=2gis-yakutsk
pkgver=27
pkgrel=1
pkgdesc="Map of Yakutsk for 2GIS, November 2013"
arch=('i686' 'x86_64')
url="http://yakutsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Yakutsk-27.orig.zip")
md5sums=('86f9595612a59fcf1ddc3ecf5632a6e2')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Yakutsk.dgdat" "${pkgdir}/opt/2gis/yakutsk.dgdat" || return 1
  
}
