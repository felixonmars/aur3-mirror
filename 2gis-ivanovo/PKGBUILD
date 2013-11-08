pkgname=2gis-ivanovo
pkgver=19
pkgrel=1
pkgdesc="Map of Ivanovo for 2GIS, November 2013"
arch=('i686' 'x86_64')
url="http://ivanovo.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Ivanovo-19.orig.zip")
md5sums=('4ec10f228d426c7e088422654d7363d6')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Ivanovo.dgdat" "${pkgdir}/opt/2gis/ivanovo.dgdat" || return 1
  
}
