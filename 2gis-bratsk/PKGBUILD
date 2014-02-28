pkgname=2gis-bratsk
pkgver=29
pkgrel=1
pkgdesc="Map of Bratsk for 2GIS, February 2014"
arch=('i686' 'x86_64')
url="http://bratsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Bratsk-29.orig.zip")
md5sums=('43b2bbce3c04b93d305014b0e906b041')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Bratsk.dgdat" "${pkgdir}/opt/2gis/bratsk.dgdat" || return 1
  
}
