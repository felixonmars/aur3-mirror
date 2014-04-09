pkgname=2gis-yaroslavl
pkgver=46
pkgrel=1
pkgdesc="Map of Yaroslavl for 2GIS, April 2014"
arch=('i686' 'x86_64')
url="http://yaroslavl.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.4.0')
source=("http://download.2gis.ru/arhives/2GISData_Yaroslavl-46.orig.zip")
md5sums=('aafd085392c65b84ba76e5acc19c978d')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Yaroslavl.dgdat" "${pkgdir}/opt/2gis/2gis-yaroslavl.dgdat" || return 1
  
}
