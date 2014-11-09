pkgname=2gis-smolensk
pkgver=29
pkgrel=1
pkgdesc="Map of Smolensk for 2GIS, November 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/smolensk/products/download#linux"
license=('custom')
depends=('2gis>=3.14.9.0')
source=("http://download.2gis.com/arhives/2GISData_Smolensk-29.orig.zip")
md5sums=('9cac5e2368cf2ad605e97352ca3c67a8')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Smolensk.dgdat" "${pkgdir}/opt/2gis/2gis-smolensk.dgdat" || return 1
  
}
