pkgname=2gis-bryansk
pkgver=28
pkgrel=1
pkgdesc="Map of Bryansk for 2GIS, June 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/bryansk/products/download#linux"
license=('custom')
depends=('2gis>=3.14.6.0')
source=("http://download.2gis.com/arhives/2GISData_Bryansk-28.orig.zip")
md5sums=('99c8a9bdf6fa4e4015589381536c047b')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Bryansk.dgdat" "${pkgdir}/opt/2gis/2gis-bryansk.dgdat" || return 1
  
}
