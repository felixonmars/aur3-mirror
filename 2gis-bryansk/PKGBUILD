pkgname=2gis-bryansk
pkgver=21
pkgrel=1
pkgdesc="Map of Bryansk for 2GIS, November 2013"
arch=('i686' 'x86_64')
url="http://bryansk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Bryansk-21.orig.zip")
md5sums=('0d6c0cea66cff0261fdb07c9929bfc20')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Bryansk.dgdat" "${pkgdir}/opt/2gis/bryansk.dgdat" || return 1
  
}
