pkgname=2gis-tomsk
pkgver=113
pkgrel=1
pkgdesc="Map of Tomsk for 2GIS, May 2014"
arch=('i686' 'x86_64')
url="http://tomsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.4.0')
source=("http://download.2gis.ru/arhives/2GISData_Tomsk-113.orig.zip")
md5sums=('d98c09051be1efc4c4d17056cd4f3df3')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Tomsk.dgdat" "${pkgdir}/opt/2gis/2gis-tomsk.dgdat" || return 1
  
}
