pkgname=2gis-magnitogorsk
pkgver=50
pkgrel=1
pkgdesc="Map of Magnitogorsk for 2GIS, June 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/magnitogorsk/products/download#linux"
license=('custom')
depends=('2gis>=3.14.6.0')
source=("http://download.2gis.com/arhives/2GISData_Magnitogorsk-50.orig.zip")
md5sums=('151123d3da0526c425438fa4473d38a1')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Magnitogorsk.dgdat" "${pkgdir}/opt/2gis/2gis-magnitogorsk.dgdat" || return 1
  
}
