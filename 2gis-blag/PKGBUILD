pkgname=2gis-blag
pkgver=32
pkgrel=1
pkgdesc="Map of Blagoveschensk for 2GIS, May 2014"
arch=('i686' 'x86_64')
url="http://blagoveshensk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.4.0')
source=("http://download.2gis.ru/arhives/2GISData_Blagoveshensk-32.orig.zip")
md5sums=('c2d37c1e7bd7ab6ccf9d39744c48fbe5')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Blagoveshensk.dgdat" "${pkgdir}/opt/2gis/2gis-blag.dgdat" || return 1
  
}
