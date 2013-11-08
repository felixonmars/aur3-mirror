pkgname=2gis-orenburg
pkgver=28
pkgrel=1
pkgdesc="Map of Orenburg for 2GIS, November 2013"
arch=('i686' 'x86_64')
url="http://orenburg.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Orenburg-28.orig.zip")
md5sums=('b5e89a7f4ce079b815b7f5bb5ea8764a')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Orenburg.dgdat" "${pkgdir}/opt/2gis/orenburg.dgdat" || return 1
  
}
