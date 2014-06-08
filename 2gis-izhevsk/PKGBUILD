pkgname=2gis-izhevsk
pkgver=39
pkgrel=1
pkgdesc="Map of Izhevsk for 2GIS, June 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/izhevsk/products/download#linux"
license=('custom')
depends=('2gis>=3.14.6.0')
source=("http://download.2gis.com/arhives/2GISData_Izhevsk-39.orig.zip")
md5sums=('ddb591bcd959c096edf4fc4344d06d43')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Izhevsk.dgdat" "${pkgdir}/opt/2gis/2gis-izhevsk.dgdat" || return 1
  
}
