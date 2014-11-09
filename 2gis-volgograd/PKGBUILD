pkgname=2gis-volgograd
pkgver=50
pkgrel=1
pkgdesc="Map of Volgograd for 2GIS, November 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/volgograd/products/download#linux"
license=('custom')
depends=('2gis>=3.14.9.0')
source=("http://download.2gis.com/arhives/2GISData_Volgograd-50.orig.zip")
md5sums=('91ea589a2f3547e6a19c3d6dead43156')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Volgograd.dgdat" "${pkgdir}/opt/2gis/2gis-volgograd.dgdat" || return 1
  
}
