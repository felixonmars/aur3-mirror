pkgname=2gis-blag
pkgver=36
pkgrel=1
pkgdesc="Map of Blagoveschensk for 2GIS, September 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/blagoveshensk/products/download#linux"
license=('custom')
depends=('2gis>=3.14.7.0')
source=("http://download.2gis.com/arhives/2GISData_Blagoveshensk-36.orig.zip")
md5sums=('d56359692c56a65499feeeaa750ceb62')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Blagoveshensk.dgdat" "${pkgdir}/opt/2gis/2gis-blag.dgdat" || return 1
  
}
