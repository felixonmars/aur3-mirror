pkgname=2gis-syktyvkar
pkgver=28
pkgrel=1
pkgdesc="Map of Syktyvkar for 2GIS, July 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/syktyvkar/products/download#linux"
license=('custom')
depends=('2gis>=3.14.7.0')
source=("http://download.2gis.com/arhives/2GISData_Syktyvkar-28.orig.zip")
md5sums=('3de5234342673ca28285ab73f6aa14d3')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Syktyvkar.dgdat" "${pkgdir}/opt/2gis/2gis-syktyvkar.dgdat" || return 1
  
}
