pkgname=2gis-smolensk
pkgver=27
pkgrel=1
pkgdesc="Map of Smolensk for 2GIS, September 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/smolensk/products/download#linux"
license=('custom')
depends=('2gis>=3.14.7.0')
source=("http://download.2gis.com/arhives/2GISData_Smolensk-27.orig.zip")
md5sums=('b6600dc93b3879e5b66ed8a562bbf598')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Smolensk.dgdat" "${pkgdir}/opt/2gis/2gis-smolensk.dgdat" || return 1
  
}
