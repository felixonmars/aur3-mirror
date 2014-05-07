pkgname=2gis-astrakhan
pkgver=102
pkgrel=1
pkgdesc="Map of Astrakhan for 2GIS, May 2014"
arch=('i686' 'x86_64')
url="http://astrahan.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.4.0')
source=("http://download.2gis.ru/arhives/2GISData_Astrakhan-102.orig.zip")
md5sums=('7756ed01bd495b6d12e86a610dc2cf47')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Astrakhan.dgdat" "${pkgdir}/opt/2gis/2gis-astrakhan.dgdat" || return 1
  
}
