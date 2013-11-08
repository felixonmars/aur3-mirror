pkgname=2gis-irkutsk
pkgver=91
pkgrel=1
pkgdesc="Map of Irkutsk for 2GIS, November 2013"
arch=('i686' 'x86_64')
url="http://irkutsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Irkutsk-91.orig.zip")
md5sums=('68de2fd2a5f0b0dae647a994e54b236a')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Irkutsk.dgdat" "${pkgdir}/opt/2gis/irkutsk.dgdat" || return 1
  
}
