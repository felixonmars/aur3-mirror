pkgname=2gis-kurgan
pkgver=96
pkgrel=1
pkgdesc="Map of Kurgan for 2GIS, March 2014"
arch=('i686' 'x86_64')
url="http://kurgan.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Kurgan-96.orig.zip")
md5sums=('4d0486fad05fb4dfbb71861c3ca36df2')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Kurgan.dgdat" "${pkgdir}/opt/2gis/kurgan.dgdat" || return 1
  
}
