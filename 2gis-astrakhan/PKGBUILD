pkgname=2gis-astrakhan
pkgver=99
pkgrel=1
pkgdesc="Map of Astrakhan for 2GIS, February 2014"
arch=('i686' 'x86_64')
url="http://astrakhan.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Astrakhan-99.orig.zip")
md5sums=('87a67a33cae39f287c91f6df635a6b95')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Astrakhan.dgdat" "${pkgdir}/opt/2gis/astrakhan.dgdat" || return 1
  
}
