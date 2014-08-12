pkgname=2gis-sterlitamak
pkgver=33
pkgrel=1
pkgdesc="Map of Sterlitamak for 2GIS, August 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/sterlitamak/products/download#linux"
license=('custom')
depends=('2gis>=3.14.7.0')
source=("http://download.2gis.com/arhives/2GISData_Sterlitamak-33.orig.zip")
md5sums=('ade775823d50be3ebd5d3f3aab8fb954')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Sterlitamak.dgdat" "${pkgdir}/opt/2gis/2gis-sterlitamak.dgdat" || return 1
  
}
