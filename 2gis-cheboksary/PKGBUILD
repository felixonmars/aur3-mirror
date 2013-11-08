pkgname=2gis-cheboksary
pkgver=25
pkgrel=1
pkgdesc="Map of Cheboksary for 2GIS, November 2013"
arch=('i686' 'x86_64')
url="http://cheboksary.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Cheboksary-25.orig.zip")
md5sums=('d34de5d0821e7573740f16c549cfb7e3')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Cheboksary.dgdat" "${pkgdir}/opt/2gis/cheboksary.dgdat" || return 1
  
}
