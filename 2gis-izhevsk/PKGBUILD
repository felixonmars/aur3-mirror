pkgname=2gis-izhevsk
pkgver=35
pkgrel=1
pkgdesc="Map of Izhevsk for 2GIS, February 2014"
arch=('i686' 'x86_64')
url="http://izhevsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Izhevsk-35.orig.zip")
md5sums=('f1e0ec49b6cf1058ce6b70965064ecc3')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Izhevsk.dgdat" "${pkgdir}/opt/2gis/izhevsk.dgdat" || return 1
  
}
