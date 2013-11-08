pkgname=2gis-samara
pkgver=64
pkgrel=1
pkgdesc="Map of Samara for 2GIS, November 2013"
arch=('i686' 'x86_64')
url="http://samara.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Samara-64.orig.zip")
md5sums=('a0ee3a938e9c9452513b4f0ea1ac1b98')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Samara.dgdat" "${pkgdir}/opt/2gis/samara.dgdat" || return 1
  
}
