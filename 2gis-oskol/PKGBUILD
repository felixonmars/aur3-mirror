pkgname=2gis-oskol
pkgver=27
pkgrel=1
pkgdesc="Map of Stary Oskol for 2GIS, May 2014"
arch=('i686' 'x86_64')
url="http://staryi-oskol.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.4.0')
source=("http://download.2gis.ru/arhives/2GISData_Staroskol-27.orig.zip")
md5sums=('8e315bab732e8866d43398b646270473')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Staroskol.dgdat" "${pkgdir}/opt/2gis/2gis-oskol.dgdat" || return 1
  
}
