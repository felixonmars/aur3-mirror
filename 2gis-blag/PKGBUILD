pkgname=2gis-blag
pkgver=28
pkgrel=1
pkgdesc="Map of Blagoveschensk for 2GIS, January 2014"
arch=('i686' 'x86_64')
url="http://blag.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Blagoveshensk-28.orig.zip")
md5sums=('d2c8e3a45ca7c399395b1457e0df435b')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Blagoveshensk.dgdat" "${pkgdir}/opt/2gis/blag.dgdat" || return 1
  
}
