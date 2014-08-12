pkgname=2gis-blag
pkgver=35
pkgrel=1
pkgdesc="Map of Blagoveschensk for 2GIS, August 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/blagoveshensk/products/download#linux"
license=('custom')
depends=('2gis>=3.14.7.0')
source=("http://download.2gis.com/arhives/2GISData_Blagoveshensk-35.orig.zip")
md5sums=('df608949f0ae25ef6ff8c6faac9594a9')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Blagoveshensk.dgdat" "${pkgdir}/opt/2gis/2gis-blag.dgdat" || return 1
  
}
