pkgname=2gis-novosibirsk
pkgver=187
pkgrel=2
pkgdesc="Map of Novosibirsk for 2GIS, April 2014"
arch=('i686' 'x86_64')
url="http://novosibirsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.4.0')
source=("http://download.2gis.ru/arhives/2GISData_Novosibirsk-187.orig.zip")
md5sums=('10d854de335b3462dafccf854bcc9e6c')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Novosibirsk.dgdat" "${pkgdir}/opt/2gis/2gis-novosibirsk.dgdat" || return 1
  
}
