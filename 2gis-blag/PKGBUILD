pkgname=2gis-blag
pkgver=33
pkgrel=1
pkgdesc="Map of Blagoveschensk for 2GIS, June 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/blagoveshensk/products/download#linux"
license=('custom')
depends=('2gis>=3.14.6.0')
source=("http://download.2gis.com/arhives/2GISData_Blagoveshensk-33.orig.zip")
md5sums=('c62adfc36eb0039a90c5868625502dac')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Blagoveshensk.dgdat" "${pkgdir}/opt/2gis/2gis-blag.dgdat" || return 1
  
}
