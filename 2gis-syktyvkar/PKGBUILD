pkgname=2gis-syktyvkar
pkgver=27
pkgrel=1
pkgdesc="Map of Syktyvkar for 2GIS, June 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/syktyvkar/products/download#linux"
license=('custom')
depends=('2gis>=3.14.6.0')
source=("http://download.2gis.com/arhives/2GISData_Syktyvkar-27.orig.zip")
md5sums=('679bcf4a62d95993ad2106e2c3e0e370')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Syktyvkar.dgdat" "${pkgdir}/opt/2gis/2gis-syktyvkar.dgdat" || return 1
  
}
