pkgname=2gis-tula
pkgver=48
pkgrel=1
pkgdesc="Map of Tula for 2GIS, November 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/tula/products/download#linux"
license=('custom')
depends=('2gis>=3.14.9.0')
source=("http://download.2gis.com/arhives/2GISData_Tula-48.orig.zip")
md5sums=('8082a313a5bef348030c1f2b0ba04d45')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Tula.dgdat" "${pkgdir}/opt/2gis/2gis-tula.dgdat" || return 1
  
}
