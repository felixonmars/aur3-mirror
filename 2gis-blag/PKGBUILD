pkgname=2gis-blag
pkgver=38
pkgrel=1
pkgdesc="Map of Blagoveschensk for 2GIS, November 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/blagoveshensk/products/download#linux"
license=('custom')
depends=('2gis>=3.14.9.0')
source=("http://download.2gis.com/arhives/2GISData_Blagoveshensk-38.orig.zip")
md5sums=('3b5a5ade7ed873ced1f5a7df681e67fc')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Blagoveshensk.dgdat" "${pkgdir}/opt/2gis/2gis-blag.dgdat" || return 1
  
}
