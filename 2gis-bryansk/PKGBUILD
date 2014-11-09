pkgname=2gis-bryansk
pkgver=33
pkgrel=1
pkgdesc="Map of Bryansk for 2GIS, November 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/bryansk/products/download#linux"
license=('custom')
depends=('2gis>=3.14.9.0')
source=("http://download.2gis.com/arhives/2GISData_Bryansk-33.orig.zip")
md5sums=('e165053b9594006371d4e1da2db92fc3')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Bryansk.dgdat" "${pkgdir}/opt/2gis/2gis-bryansk.dgdat" || return 1
  
}
