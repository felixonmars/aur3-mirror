pkgname=2gis-ntagil
pkgver=31
pkgrel=1
pkgdesc="Map of Nizhny Tagil for 2GIS, January 2014"
arch=('i686' 'x86_64')
url="http://ntagil.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Ntagil-31.orig.zip")
md5sums=('10e7c8b1c1bbdd076c0692363876c711')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Ntagil.dgdat" "${pkgdir}/opt/2gis/ntagil.dgdat" || return 1
  
}
