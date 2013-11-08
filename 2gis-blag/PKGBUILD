pkgname=2gis-blag
pkgver=26
pkgrel=1
pkgdesc="Map of Blagoveschensk for 2GIS, November 2013"
arch=('i686' 'x86_64')
url="http://blag.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Blagoveshensk-26.orig.zip")
md5sums=('4e4593d23d2bd6114df7ed5f4bc3fccc')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Blagoveshensk.dgdat" "${pkgdir}/opt/2gis/blag.dgdat" || return 1
  
}
