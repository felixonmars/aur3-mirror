pkgname=2gis-rostov
pkgver=56
pkgrel=1
pkgdesc="Map of Rostov-na-Donu for 2GIS, November 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/rostov-na-donu/products/download#linux"
license=('custom')
depends=('2gis>=3.14.9.0')
source=("http://download.2gis.com/arhives/2GISData_Rostov-56.orig.zip")
md5sums=('63d2e308dbafd90d5ea6f13f0d2dccd8')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Rostov.dgdat" "${pkgdir}/opt/2gis/2gis-rostov.dgdat" || return 1
  
}
