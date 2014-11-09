pkgname=2gis-tyumen
pkgver=96
pkgrel=1
pkgdesc="Map of Tyumen for 2GIS, November 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/tyumen/products/download#linux"
license=('custom')
depends=('2gis>=3.14.9.0')
source=("http://download.2gis.com/arhives/2GISData_Tyumen-96.orig.zip")
md5sums=('61c0a3aa908e1746b72fb69b2b7336fc')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Tyumen.dgdat" "${pkgdir}/opt/2gis/2gis-tyumen.dgdat" || return 1
  
}
